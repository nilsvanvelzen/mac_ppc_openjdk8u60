sudo ulimit -l unlimited
sudo ulimit -n 512

#bash configure --with-num-cores=2  --disable-headful --enable-option-checking=fatal --with-boot-jdk=/Users/nils/Devel/jdk/openjdk7-zerovm-ppc-jyeary-2012-02-16-07-18-b00 --with-jvm-variants=zero CC=gcc-4.2 CXX=g++-4.2
bash configure --with-num-cores=2  --disable-headful --enable-option-checking=fatal --with-boot-jdk=/Users/nils/Devel/jdk/openjdk7-zerovm-ppc-jyeary-2012-02-16-07-18-b00 --with-jvm-variants=zero CC=gcc-mp-6 CXX=g++-mp-6


#make HOTSPOT_DISABLE_DTRACE_PROBES=true LOG=debug BUILD_HEADLESS_ONLY=true
make HOTSPOT_DISABLE_DTRACE_PROBES=true LOG=debug 

