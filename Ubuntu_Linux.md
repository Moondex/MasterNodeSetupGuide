

# Install MoonDEX Masternode on Ubuntu VPS (DEPRICATED)
As of November 2018, the below instructions will not work due to changes in the install script.  This file is being kept for archival purposes.

## VPS Requirements:
- LINUX VPS Ubuntu 16.04 (recommend using this version 64bits)
- Minimum 1GB RAM
- 1 CPU
- 40-50GB Storage
- Public IP Address
- VPS Providers you can use: VULTR, DigitalOcean, AWS

## Windows or Mac:

- Wallet installed
- At least 2501 MDEX coins

## Some basic knowledge of:

- PuTTY if you’re using Windows
- Terminal SSH commands if you’re using MAC



## Masternode Installation
---

### * Step One: Pay __EXACTLY__ 2500 MDEX to yourself

Make sure you have a little more than 2500 MDEX in your balance. It can just be 2501 MDEX.

1. Go to File -> Receiving Addresses

2. Click on  `New`  and give label name, something like `mn1` and click `Ok`. Select the created address and click `copy`.

3. On your main window go to `Send` tab. Paste the copied address to address box. Type 2500 for `Amount` box. __Do not select__ `Subtract fee from amount` checkbox. Send the coin.
Now it will take some time until this transaction is confirmed.

### * Step Two: Install Masternode

Login to your VPS server with `root` user. Make sure you are in `root` directory.

Copy the follow commands and excute them.

```
cd /root

apt-get install wget -y

wget https://raw.githubusercontent.com/Moondex/moondex_sentinel/master/moondexcoin_mn.sh

chmod 740 moondexcoin_mn.sh

./moondexcoin_mn.sh

```

Grab a tea because it will take some time. Wait until the following is printed to the console: `Job completed successfully`. It will also print masternode private key as: `Masternode private key:`.

Copy that somewhere, you will use it later.

### * Step Three: Set Masternode config

Once your 2500 MDEX transaction is confirmed

Go to Tools → Debug Console

In text box below run the following command

masternode outputs

It should print something like this:

{
“werdf5a539ea889sgs434287ce8hyy6s5rqf1p12bbb58ac8uusy2eb8177”:“1”
}

The long string is the transaction id of your payment and the number is transaction index. Save them too, you will use them shortly.

Note that transaction id and index number do not contain quotes. In the example above transaction id is: werdf5a539ea889sgs434287ce8hyy6s5rqf1p12bbb58ac8uusy2eb8177 .

Go to Tools → Masternode configuration file. It will open your masternode config file.

In a new line type your masternode data, the syntax is as following:

alias vps_ip:8906 masternode_priv_key trx_id_of_your_payment trx_index

You can copy paste the line above and replace with your own ip, privkey, transaction id and index. Note that each data is separated by space, so do not introduce any space yourself. For example, giving the following alias is wrong.

`My alias`

__Remember that transaction id and index do not contain any quotes__

The final output should look something like:

```
mn1 100.121.32.112:8906 1erew5a539ea889sgs434287ce8hyy6s5r222bbb58ac8uusy2eb8177 werdf5a539ea889sgs434287ce8hyy6s5rqf1p12bbb58ac8uusy2eb8177 1
```

Save and close the config file. Restart the wallet.

Go to «Masternodes» tab (Settings → Options → Wallet → Show Masternodes Tab). You should see your configured masternode as missing. Click on `Start Missing`, give your passphrase and confirm.

Now you should see your masternode as `PRE_ENABLED` or `ENABLED`

If so, you are all set. It will start getting rewards in around 24 hours.

Happy Collecting your Masternode Rewards!
