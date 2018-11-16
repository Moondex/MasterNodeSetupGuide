# MoonDEX Masternode Setup Guide
Guide to help you setup an MDEX coin masternode:
https://github.com/click2install/moondex

---
## FAQ

### What should I do if I get "No Block Source Available" error from my GUI (Windows, etc.) wallet?

Add the nodes below into your moondex.conf file and restart the wallet will fix the issue:

```
addnode=140.82.48.96:8906
addnode=207.148.102.250:8906
addnode=139.162.238.190:8906
addnode=104.236.208.223:8906
addnode=207.154.252.125:8906
addnode=45.77.205.193:8906
addnode=45.63.114.37:8906
addnode=149.28.161.1:8906
addnode=199.247.14.215:8906
addnode=140.82.25.118:8906
addnode=147.135.247.146:8906
addnode=45.76.36.17:8906
addnode=188.40.174.163:8906
```

Alternatively you can open the **Tools -> Debug console** from your GUI wallet and manually add those nodes using this format with the above list of addresses or the address of any working masternode:
```
addnode 140.82.48.96:8906 onetry
```

---
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
