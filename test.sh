busybox echo -e "Hello-world-from-bash\n test" | busybox awk '$1=$1' FS="-" OFS=" " | grep Hello
#busybox echo -e "Hello-world-from\ntest" | grep test
#echo "Hello-world-from-bash" > /root/output.txt
#busybox cat /root/output.txt
