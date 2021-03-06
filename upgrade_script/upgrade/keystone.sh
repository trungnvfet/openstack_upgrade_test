# Start upgrade kestone
echo "Set global variable to Database"
sleep 1
mysql -uroot -pnam123 -h10.164.180.87 -e "set global log_bin_trust_function_creators=1"

echo "Start to upgrade Keystone on controller1"
ssh controller1 "bash /root/test/keystone/1_upgrade_source.sh"
ssh controller1 "bash /root/test/keystone/2_upgrade_database.sh"
echo "Start to upgrade Keystone on controller2"
ssh controller2 "bash /root/test/keystone/1_upgrade.sh"
echo "Start to upgrade Keystone on controller3"
ssh controller3 "bash /root/test/keystone/1_upgrade.sh"
