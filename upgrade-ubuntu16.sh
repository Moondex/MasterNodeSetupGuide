

echo ""
echo "=================================================================="
echo "Updating MoonDEX VPS Masternode on Ubuntu 16"
echo "Please wait..."
echo "=================================================================="
echo ""

WALLET_VERSION='3.0'

~/moondex/moondex-cli stop
sleep 20
wget https://github.com/Moondex/MoonDEXCoin/releases/download/3.0/ubuntu16-linux-no-gui-v${WALLET_VERSION}.tar.gz
tar -zxvf ubuntu16-linux-no-gui-v${WALLET_VERSION}.tar.gz -C moondex
~/moondex/moondexd
echo "Syncing blockchain..."
sleep 120
~/moondex/moondex-cli masternode status

echo ""
echo "=================================================================="
echo "Done!"
echo "If you can see \"status\": \"Not capable masternode: Masternode in NEW_START_REQUIRED state\""
echo "or \"status\": \"Masternode successfully started\" above,"
echo "go to your hot wallet on PC/MAC to restart the masternode."
echo "Otherwise wait till the blockchain is fully synced. Then run:"
echo "~/moondex/moondex-cli masternode status"
echo "to check again."
echo "=================================================================="
echo ""
