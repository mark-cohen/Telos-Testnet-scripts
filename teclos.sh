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

NODEHOST="127.0.0.1"
NODEPORT="8888"

WALLETHOST="127.0.0.1"
WALLETPORT="3000"


$NODEOSBINDIR/teclos/teclos -u http://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
