# MasterNodeSetupGuide
A guide to help you setup masternode for MoonDEX:

https://github.com/Moondex/MasterNodeSetupGuide/blob/master/Ubuntu_Linux.md

# Trouble shooting

## Install mnchecker

mnchecker is a tool to check your masternode for the difference between local block height and the block height on the explorer. If your masternode is 3 blocks behind(considered stuck), mnchecker will reset your local wallet and let it resync with the mainnet.

mnchecker is part of the installation script, there is no need to install again if you use MoonDEX's script.

To install(root user, please change your user path if different):

```
cd /root
mkdir mnchecker
cd mnchecker
wget https://raw.githubusercontent.com/Moondex/mnchecker/master/mnchecker
chmod 740 mnchecker
./mnchecker

```

Add a cron job to run the check every 15 minutes 

```
crontab -l > tempcron
echo "*/15 * * * * /root/mnchecker/mnchecker >> /root/mnchecker/checker.log 2>&1" >> tempcron
crontab tempcron
rm tempcron

```

Or you can mannually add a new cron job by running

```
crontab -e
```
Then add the line below at the end of the file
```
*/15 * * * * /root/mnchecker/mnchecker >> /root/mnchecker/checker.log 2>&1
```

Run `cat /root/mnchecker/checker.log` to check the logs.



## Reset VPS Wallet

If the VPS wallet fails to sync, you can run the commands below to reset it:

```
cd /root

apt-get install wget -y

wget https://raw.githubusercontent.com/Moondex/MasterNodeSetupGuide/master/reset_vps_wallet.sh

chmod 740 reset_vps_wallet.sh

./reset_vps_wallet.sh

```

Then run

`~/moondex/moondex-cli masternode status`

You should get "status": "Not capable masternode: Masternode in NEW_START_REQUIRED state" or "status": "Masternode successfully started".

If not, you will have to wait for the blockchain to be fully synced.

Go to your wallet on PC/Mac to restart the node.

## Show masternode status

Run the following commands to show the status of masternode

```
cd /root

apt-get install wget -y

wget https://raw.githubusercontent.com/Moondex/MasterNodeSetupGuide/master/check_node.sh

chmod 740 check_node.sh

./check_node.sh

```

