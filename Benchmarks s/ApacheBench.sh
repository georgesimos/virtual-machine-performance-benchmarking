for r in 1 2 3
do     
  echo "Round ${r} - $(date +%Y%m%d)"
  ab -n 1000 -c 10 -g without_flag_${r}.data http://83.212.112.180/ > without_flag_${r}.txt 
  echo "Without Flags"
  echo "---------------------"
  cat without_flag_${r}.txt 
  echo "---------------------"
  ab -l -r -n 1000 -c 10 -g with_flag_${r}.data -k -H "Accept-Encoding: gzip, deflate" http://83.212.112.180/ > with_flag_${r}.txt 
  echo "With Flags"
  echo "---------------------"
  cat with_flag_${r}.txt 
  echo "---------------------"
done