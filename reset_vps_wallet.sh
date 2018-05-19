echo ""
echo "=================================================================="
echo "Resetting MoonDEX VPS Wallet  "
echo "Please wait..."
echo "=================================================================="
echo ""

rm -rf ~/.moondexcore-bk
~/moondex/moondex-cli stop
sleep 20
mv ~/.moondexcore ~/.moondexcore-bk
mkdir ~/.moondexcore
cp ~/.moondexcore-bk/wallet.dat ~/.moondexcore/
cp ~/.moondexcore-bk/moondex.conf ~/.moondexcore/
cp ~/.moondexcore-bk/masternode.conf ~/.moondexcore/
cp -a ~/.moondexcore-bk/moondex_sentinel/. ~/.moondexcore/moondex_sentinel/
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
