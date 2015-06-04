# choose your username by vim

#include init
. ./init.sh
#exce init function in init.sh
init
clear

grep '^python' /etc/passwd || /usr/sbin/useradd --groups=web python

function install_python3()
{

echo "============================ Install Python 3.4.3 ================================"

if [ -e "$dst_root/bin/python3.4" ]; then
    echo "python3.4 exits!!"
    exit 0
fi

cd $soft_dir

if [ -s "$soft_dir/Python-3.4.3.tgz" ]; then
    echo 'Python-3.4.3.tgz [found]'
else
    echo 'Downloading Python-3.4.3.tgz'
    wget -c 'https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz' 
fi

tar zxf Python-3.4.3.tgz
cd Python-3.4.3
./configure --prefix=$dst_root
make && make install

cd $soft_dir

# upgrade pip
pip3.4 install --upgrade pip | tee /root/as-pip.log
# install supervisor
}

install_python3 2>&1 | tee /root/as-python3.log
