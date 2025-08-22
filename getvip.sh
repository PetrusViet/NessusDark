curl --url "https://plugins.nessus.org/v2/nessus.php?f=all-2.0.tar.gz&u=1afaaf2eee350f1b2980914445e12165&p=a1a225a4c9ad9cb68f9693d984c4f4f9" \
    --output "all-2.0.tar.gz"
sudo docker cp all-2.0.tar.gz nessus:/root
sudo docker cp plugins_feed_info.inc nessus:/root
sudo docker exec nessus /opt/nessus/sbin/nessuscli update /root/all-2.0.tar.gz
sudo docker cp plugins_feed_info.inc nessus:/opt/nessus/lib/nessus/plugins/plugin_feed_info.inc
sudo docker cp plugins_feed_info.inc nessus:/opt/nessus/var/nessus/plugin_feed_info.inc
sudo docker cp plugins_feed_info.inc nessus:/opt/nessus/var/nessus/.plugin_feed_info.inc
sudo docker exec nessus chattr +i /opt/nessus/var/nessus/plugin_feed_info.inc /opt/nessus/var/nessus/.plugin_feed_info.inc
sudo docker exec nessus chattr +i -R /opt/nessus/lib/nessus/plugins
sudo docker exec nessus chattr -i /opt/nessus/lib/nessus/plugins/plugin_feed_info.inc
sudo docker exec nessus chattr -i /opt/nessus/lib/nessus/plugins
