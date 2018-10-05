#!/bin/bash

################################################################################
#
# Script created by http://CryptoLions.io
# For EOS mainnet
# https://github.com/CryptoLions/EOS-MainNet
#
# Modified for Telos Testnet
# last edited by Telos Vancouver 20180921
#
###############################################################################

NODEOSBINDIR="/opt/TelosTestnet/telos/build/programs"
DATADIR="/opt/TelosTestnet/Data/telos-wallet"
WALLET_HOST="127.0.0.1"
WALLET_POSRT="3000"


$DATADIR/stop_wallet.sh
$NODEOSBINDIR/tkeosd/tkeosd --config-dir $DATADIR --wallet-dir $DATADIR --http-server-address $WALLET_HOST:$WALLET_POSRT $@ & echo $! > $DATADIR/wallet.pid
