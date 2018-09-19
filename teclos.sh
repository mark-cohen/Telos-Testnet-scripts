#!/bin/bash
################################################################################
#
# Script originally created by http://CryptoLions.io
# https://github.com/CryptoLions/scripts/
#
# Modified for Telos http://testnet.telosfoundation.io/
#
###############################################################################

NODEOSBINDIR="/home/telos/build/programs"

WALLETHOST="127.0.0.1"
NODEHOST="127.0.0.1"
NODEPORT="8888"
WALLETPORT="3000"

$NODEOSBINDIR/teclos/teclos -u http://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
