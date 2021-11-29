#!/bin/bash

#############################################
##      Strayacoin Ubuntu Build script     ##
#############################################

## Let's set some variables:
version="1.0.0"

# Find the true path of the script.  This is important for the file lookups performed.
# The explanation for this can be found here:  https://stackoverflow.com/a/246128/7831034
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# We don't want to be root for this:
if [[ $(echo whoami) == "root" ]]; then
  echo
  echo "This script should never be run as root.  This will elevate as needed."
  echo "Please run this again as a non-root user."
  exit 1
fi

### This will currently only work on Desktop ubuntu based distros. 
# Let's check for the presence of apt-get.
if [[ -z $(which apt-get) ]]; then 
  echo "This script is (currently) only designed to run on Ubuntu based machines."
  echo "Cannot continue."
  exit 1
fi

# Then for the desktop itself:
dpkg -l ubuntu-desktop > /dev/null
exit_status=$?
if [[ $exit_status -gt 0 ]]; then
  echo "This script is (currently) only designed to run on Desktop machines."
  echo "Cannot continue."
  exit 1
fi

## Ensure the user knows what's about to happen.

echo "#############################################"
echo "##      Strayacoin Ubuntu Build script     ##"
echo "#############################################"
echo
echo "This will compile and install the key-components of the Strayacoin Core, including a graphical wallet, and a mining script (should you choose to use that."
echo "This will also install dependencies that are needed for this to work."
echo "This will also ask you for your user password at least once.  This is to install the dependencies required."
echo "This will take some time!!  Be patient"
echo
unset user_input
while [[ ! ${user_input} =~ (^[yY]$|^[yY][eE][sS]$|^[nN]$|^[nN][oO]$) ]]; do
  read -r -p "Do you wish to continue? [Y/n] "
  user_input=${user_input:="y"}
  if [[ ! ${user_input} =~ (^[yY]$|^[yY][eE][sS]$|^[nN]$|^[nN][oO]$) ]]; then
    echo -n "Invalid Input."
    unset user_input
  elif [[ ${user_input} =~ (^[yY]$|^[yY][eE][sS]$) ]]; then
    user_input=y
  elif [[ ${user_input} =~ (^[nN]$|^[nN][oO]$) ]]; then
    user_input=n
  fi
done
if [ "$user_input" == "n" ]; then 
  echo "Exiting on user input."
  exit 0
fi

## By now, we know we want to proceed.

# Let's install some dependencies we know we need.
echo "Installing the dependencies."
sleep 2
sudo apt-get update && sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev libzmq3-dev libboost-all-dev
exit_status=$?

if [[ $exit_status -gt 0 ]]; then
  echo
  echo "There was an error relating to the packages.  Please look at the output above, fix any issues, and try again."
  exit 1
fi

# Read in the Ubuntu Version number:
. /etc/lsb-release

if [[ $(echo $DISTRIB_RELEASE | cut -d'.' -f1) -le 18 ]]; then
  sudo add-apt-repository -y ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get -y install libdb4.8-dev libdb4.8++-dev
else
  git -C $HOME clone https://github.com/bitcoin/bitcoin.git
  ${HOME}/bitcoin/contrib/install_db4.sh "$HOME/bitcoin"
fi

./autogen.sh
exit_status=$?
if [[ $exit_status -gt 0 ]]; then
  echo
  echo "There was an error relating to the generation of configuration.  Please look at the output above, fix any issues, and try again."
  exit 1
fi

## configure the packages.
export BDB_PREFIX="$HOME/bitcoin/db4"
./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include"

# Error handling
exit_status=$?
if [[ $exit_status -gt 0 ]]; then
  echo
  echo "There was an error relating to the configuration.  Please look at the output above, fix any issues, and try again."
  exit 1
fi

make
exit_status=$?

if [[ $exit_status -gt 0 ]]; then
  echo
  echo "There was an error relating to the compilation of packages.  Please look at the output above, fix any issues, and try again."
  exit 1
fi

sudo make install

exit_status=$?
if [[ $exit_status -gt 0 ]]; then
  echo
  echo "There was an error relating to the installation of packages.  Please look at the output above, fix any issues, and try again."
  exit 1
fi

sudo cp ${DIR}/bin/unix/* /usr/local/bin
sudo chmod +x /usr/local/bin/mine-*

echo
echo "####################################################################"
echo "Congratulations!"
echo "The install has been successful."
echo
echo "There are a couple of important steps to complete the installation, though, that this script cannot do."
echo
echo "run strayacoin-qt, accept the defaults, then close it"
echo "run cp $DIR/strayacoin.conf ~/.strayacoin/"
echo "restart strayacoin-qt and the wallet should eventually sync"
echo
echo "If you wish to mine: after syncing, run mine-single or mine-multithreaded while the strayacoin-qt wallet is open to begin mining."
echo