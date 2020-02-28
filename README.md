# MoonDEX Masternode Setup Guide

Step 1 : Make sure you have a VPS with Ubuntu 16.04 available and you are logged in as user root.

Step 2 : Run commands :

wget https://raw.githubusercontent.com/Moondex/moondex_sentinel/master/moondexcoin_mn.sh
chmod +x moondexcoin_mn.sh
./moondexcoin_mn.sh 

Follow the instructions on your screen.

---
## FAQ

### Do you have a sample moondex.conf for the PC Wallet?

For the PC Wallet, you normally do not need to change the moondex.conf. If the wallet fails to sync, you can have a check at the above [fix](#what-should-i-do-if-i-get-no-block-source-available-error-from-my-wallet)

---
### Do you have a sample moondex.conf for the masternode VPS ?

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
bind=YOUR_VPS_IP
maxconnections=256
masternode=1
masternodeprivkey=YOUR_PRIVATE_KEY
```
---
