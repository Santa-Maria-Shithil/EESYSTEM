
#sudo rm -r Overall_cpuUsage.txt 

i=0
while true; do

        top -bn1 | grep "Cpu(s)" |sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |awk '{print 100 - $1}' 2>&1 | tee -a Overall_cpuUsage_server.txt 
        sleep 1
    done