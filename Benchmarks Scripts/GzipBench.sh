# for compress
for r in 1 2 3
do     
  echo "Round ${r}"
  echo "---------------------"
  for i in 1 6 9
    do 
      cat testfile | /usr/bin/time -f "%E %S %U %P" -o timerOutputCompress.${r}.${i}.txt gzip -${i} > testfile.${r}.${i}.gz 
      cat timerOutputCompress.${r}.${i}.txt
      gzip -lv testfile.${r}.${i}.gz 
  done
done

# for uncompress
for r in 1 2 3
do     
  echo "Round ${r}"
  echo "---------------------"
  for i in 1 6 9
    do 
       cat testfile.${r}.${i}.gz | /usr/bin/time -f "%E %S %U %P" -o timerOutputUncompress.${r}.${i}.txt gzip -d > /dev/null 
       cat timerOutputUncompress.${r}.${i}.txt
   done
done