#In order to avoid unavailable resource errors during build we change some ulimit values
sudo ulimit -l unlimited
sudo ulimit -n 512

# run configure:
#  --with-num-cores=1 :  Parallel build of jdk seems to fail sometimes -ljava not found.
#                        Most likely caused by incorrect hacks made in the makefiles
#                        a sequential build seems to be fine, hence we set 
#  --disable-headful  :  Well we are initially happy when we have a kind of working headless version
#  --enable-option-checking=fatal  : Hmm, forgot why we need this
#  --with-boot-jdk    :  you need a jkd 1.7 in order to build fortunalely a 1.7 version has been build by J. Yeary
#
#  --with-jvm-variants=zero :Zero version without assembly stuff is the only hope for a hotspot for Mac PPC
#  CC=gcc-4.2 CXX=g++-4.2  :The Apple compilers of XCode 3. no succesfull build (yet) using other compilers from e.g. macport
#

# set location of your bootstrap jdk (download from https://wiki.openjdk.java.net/display/BSDPort/Darwin9Build)
bootstrap_jdk=/Users/nils/Devel/jdk/openjdk7-zerovm-ppc-jyeary-2012-02-16-07-18-b00
#

bash configure --prefix=$HOME/java8 --with-num-cores=1  --disable-headful --enable-option-checking=fatal --with-boot-jdk=$bootstrap_jdk --with-jvm-variants=zero CC=gcc-4.2 CXX=g++-4.2

# don't know how to get the dtrace stuff working hence we disable it in the make (and hacks in makefiles)
make HOTSPOT_DISABLE_DTRACE_PROBES=true LOG=debug 
make HOTSPOT_DISABLE_DTRACE_PROBES=true LOG=debug install

