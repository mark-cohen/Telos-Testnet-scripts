
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

DIR="/opt/TelosTestnet/Data/telos-wallet"

    if [ -f $DIR"/wallet.pid" ]; then
        pid=$(cat $DIR"/wallet.pid")
        echo $pid
        kill $pid
        rm -r $DIR"/wallet.pid"

        echo -ne "Stopping Wallet"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        echo -ne "\rWallet stopped. \n"

    fi
