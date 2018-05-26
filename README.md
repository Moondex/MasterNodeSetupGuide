# MoonDEX Coin Guide

<!-- TOC -->

- [MoonDEX Coin Guide](#moondex-coin-guide)
    - [MasterNodeSetupGuide](#masternodesetupguide)
    - [FAQ](#faq)
        - [What should I do if I get "No Block Source Available" error from my wallet?](#what-should-i-do-if-i-get-no-block-source-available-error-from-my-wallet)
        - [Do you have a sample moondex.conf for the PC Wallet?](#do-you-have-a-sample-moondexconf-for-the-pc-wallet)
        - [Do you have a sample moondex.conf for the VPS ?](#do-you-have-a-sample-moondexconf-for-the-vps)
        - [My masternode changed to "EXPIRED", what should I do?](#my-masternode-changed-to-expired--what-should-i-do)
    - [Trouble shooting](#trouble-shooting)
        - [Install mnchecker](#install-mnchecker)
        - [Reset VPS Wallet](#reset-vps-wallet)
        - [Show masternode status](#show-masternode-status)

<!-- /TOC -->


## MasterNodeSetupGuide
A guide to help you setup masternode for MoonDEX:

https://github.com/Moondex/MasterNodeSetupGuide/blob/master/Ubuntu_Linux.md

---
## FAQ

### What should I do if I get "No Block Source Available" error from my wallet?

Add the nodes below into your moondex.conf file and restart the wallet will fix the issue:

```
addnode=140.82.48.96:8906
addnode=207.148.102.250:8906
addnode=139.162.238.190:8906
addnode=104.236.208.223:8906
addnode=207.154.252.125:8906
addnode=79.137.56.119:8906
addnode=91.134.232.237:8906
addnode=87.98.233.148:8906
addnode=147.135.201.197:8906
addnode=217.182.36.218:8906
addnode=209.250.227.90:8906
addnode=176.31.214.147:8906
addnode=188.165.10.239:8906
addnode=54.36.5.66:8906
addnode=178.32.52.45:8906
addnode=145.239.109.60:8906
addnode=54.38.165.182:8906
addnode=46.105.62.116:8906
addnode=136.144.179.195:8906
addnode=188.166.158.183:8906
addnode=164.132.88.93:8906
addnode=80.240.20.72:8906
addnode=217.69.0.232:8906
addnode=189.27.85.75:8906
addnode=95.179.133.241:8906
addnode=144.202.86.130:8906
addnode=207.148.104.192:8906
```

Alternatively you can open Tools -> Debug console from your wallet and manually add those nodes.

---
### Do you have a sample moondex.conf for the PC Wallet?

For the PC Wallet, you normally do not need to change the moondex.conf. If the wallet fails to sync, you can have a check at the above [fix](#what-should-i-do-if-i-get-no-block-source-available-error-from-my-wallet) 

---
### Do you have a sample moondex.conf for the VPS ?

Yes, please find it below:

```
rpcuser=YOUR_RPC_USER_NAME
rpcpassword=YOUR_RPC_PASSWORD
rpcallowip=127.0.0.1
server=1
daemon=1
listen=1
rpcport=8960
port=8906
externalip=YOUR_VPS_IP
maxconnections=256
masternode=1
masternodeprivkey=YOUR_PRIVATE_KEY
```

### My masternode changed to "EXPIRED", what should I do?

First, it can just an issue of your PC wallet not synced yet. Simply close the wallet and reopen, wait for it to be synced and check your masternode status again.

If it still says "EXPIRED", try click on "Start all" to start it.

If the problem stil exists, it could be the problems with your VPS. Login to your VPS and run the [reset script](#reset-vps-wallet)

---
## Trouble shooting


### Install mnchecker

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


---
### Reset VPS Wallet

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

---
### Show masternode status

Run the following commands to show the status of masternode

```
cd /root

apt-get install wget -y

wget https://raw.githubusercontent.com/Moondex/MasterNodeSetupGuide/master/check_node.sh

chmod 740 check_node.sh

./check_node.sh

```

