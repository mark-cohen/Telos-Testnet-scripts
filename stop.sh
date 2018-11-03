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

DIR="/opt/TelosTestnet/data"


 if [ -f $DIR"/nodeos.pid" ]; then
        pid=`cat $DIR"/nodeos.pid"`
        echo $pid
        kill $pid
        rm -r $DIR"/nodeos.pid"

        echo -ne "Stopping Nodeos"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        echo -ne "\rNodeos Stopped.    \n"
    fi

