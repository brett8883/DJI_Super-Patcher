#!/system/bin/sh

#   Call genuine dji_verify with arguments forwarding
#	calls a copy of dji_verify to avoid recursion issue
cmdlineargs=$@
#echo "command line : $cmdlineargs"
#echo "---"
/vendor/bin/original_dji_verify_copy $@ > /dev/null

return_code=$?

if [[ $return_code != 0 ]]
then
    #   If dji_verify failed, assume it's because it's trying to verify a custom unsigged file
    #   search the -o option and argument
    #   if found, spit the input file in the output file assuming we are using a fully unsigged and unencrypted file
    #   otherwise dji_verify was called without output (only to check sig) and just return 0
	echo "switching to OG mode"
	cmdarray=($cmdlineargs)
	cmdarraysize=${#cmdarray[@]}
	#echo "nombre d'arguments : $cmdarraysize"
	#echo "---"
	for index in ${!cmdarray[@]}; do
		element=${cmdarray[index]}
		#echo "$element"
		#echo "---"
		if [[ "$element" == "-o" ]] || [[ "$element" == "--output" ]]
		then
			#echo "-o found with ${cmdarray[index+1]} as argumnent"
			#cat ${cmdarray[cmdarraysize-1]} >> ${cmdarray[index+1]}
			cp ${cmdarray[cmdarraysize-1]} ${cmdarray[index+1]}
		fi
		index=index+1
	done    
    
    exit 0
    
else
    #original dji_verify succeeded by it's own, must be a genuine file
    exit $return_code
fi
