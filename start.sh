#!/bin/bash

################################################################################
#
# Script created by http://CryptoLions.io
# For EOS mainnet
# https://github.com/CryptoLions/EOS-MainNet
#
# Modified for Telos Testnet
# last edited by Telos Vancouver 20181102
#
###############################################################################

DATADIR="/opt/TelosTestnet/data"
NODEOSBINDIR="/opt/TelosTestnet/telos/build/programs/"


$DATADIR/stop.sh
echo -e "Starting Nodeos \n";

ulimit -c unlimited
ulimit -n 65535
ulimit -s 64000

$NODEOSBINDIR/nodeos/nodeos --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
