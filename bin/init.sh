sudo ip link set eno1 qlen 300000
sudo sysctl  net.core.somaxconn=300000 #16777216  #32MB
sudo sysctl net.core.netdev_max_backlog=300000 #16777216
sudo sysctl net.ipv4.tcp_max_syn_backlog=300000 #16777216
sudo sysctl net.core.netdev_budget=500  #new
sudo ethtool -C eno1 tx-usecs 122
sudo ethtool -C eno1 rx-usecs 62
sudo ethtool -G eno1 tx 511 
sudo ethtool -G eno1 rx 2047 

sudo sysctl  net.core.wmem_max=16777216 #new

sudo sysctl net.core.rmem_max=16777216 #new

sudo sysctl net.core.rmem_default=262144 #new
    
sudo sysctl net.core.wmem_default=262144 #new

sudo sysctl  net.ipv4.tcp_rmem="4096 262144 16777216"  #new

sudo sysctl  net.ipv4.tcp_wmem="4096 262144 16777216"   #new

#sudo sysctl net.ipv4.tcp_timestamps=1 #new  // may need to stop

#sudo sysctl net.ipv4.tcp_window_scaling=1

sudo sysctl  net.ipv4.tcp_sack=1  #new

#sudo sysctl  net.ipv4.tcp_no_metrics_save=1
