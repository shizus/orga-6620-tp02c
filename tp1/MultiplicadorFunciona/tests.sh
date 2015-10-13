

TEST=(	
		"success_normal"		#1
		"success_espacios"		#2
		"error_dimension"		#3
		"error_matriz1"			#4
		"error_matriz2"			#5
	)	
		
TESTDIR=Tests

touch tmp_out
touch tmp_error
for t in ${!TEST[*]}
do
	./tp0 <$TESTDIR/${TEST[t]} >tmp_out 2>tmp_error
    DIFF=$(diff -q "$TESTDIR/${TEST[t]}_out" "tmp_out")
    DIFF_ERROR=$(diff -q "$TESTDIR/${TEST[t]}_error" "tmp_error")
	if [ -z "$DIFF" ] && [ -z "$DIFF_ERROR" ]; then
		echo -e '\tTests #'$t' '${TEST[t]}': \tOK'
	else
		echo -e '\tTests #'$t' '${TEST[t]}': \tERROR'
	fi
done
rm tmp_out
rm tmp_error
