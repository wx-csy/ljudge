apt update
apt install -y git rake make g++ libseccomp-dev libseccomp2 seccomp pkg-config

git clone https://github.com/quark-zju/ljudge.git
git clone https://github.com/quark-zju/lrun.git

cd lrun
make clean
make
make install
cd ..

cd ljudge
make clean
make
make install
cp -r etc/ljudge /etc/
cd ..

# install stap env
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C8CAB6595FDFF622

codename=$(lsb_release -c | awk  '{print $2}')
tee /etc/apt/sources.list.d/ddebs.list << EOF
deb http://ddebs.ubuntu.com/ ${codename}      main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-security main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-updates  main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-proposed main restricted universe multiverse
EOF

apt update
apt install linux-image-$(uname -r)-dbgsym systemtap

gpasswd -a judger lrun
