# MasterNodeSetupGuide
A guide to help you setup masternode for MoonDEX:

https://github.com/Moondex/MasterNodeSetupGuide/blob/master/Ubuntu_Linux.md

# Trouble shooting

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

