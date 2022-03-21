ulimit -n 65536
ulimit -c 10000000000
export CC=clang
export CXX=clang++
export DEPENDENCY_PATH=/opt/dependency/package
source /opt/dependency-Darwin/package/env.sh

export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.1/libexec 
export PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
export JAVA_HOME=/usr/local/Cellar/openjdk@8/1.8.0+312/libexec/openjdk.jdk/Contents/Home
source /usr/local/oushu/oushudb/oushudb_path.sh
export DYLD_LIBRARY_PATH=/opt/dependency-Darwin/package/lib:$DYLD_LIBRARY_PATH
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bash_func='vim ~/.bash_function.sh'
alias source_rc='source  ~/.bashrc'
alias oushu_init='oushudb init cluster --with_magma -a'
source /Users/lululi/.bash_function.sh
source /Users/lululi/.git-completion.bash

mkdir -p /tmp/magma_catalog
mkdir -p /tmp/magma_data
alias lgt="ssh lululi@101.43.188.6"
alias oushu='cd /usr/local/oushu/'
export PATH=/usr/local/oushu/lavam/bin/:$PATH
export LAVA_USER="lilulu@oushutest"
export LAVA_PASSWORD="qminet8r5h"
alias startvm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --multicreate 3,3"
alias listvm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu|awk '{print $4}'"
alias listci_vm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lll|awk '{print $4}'"
alias startvm_debug="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --multicreate 3,3 --testbinary debug"
export PATH=/usr/local/oushu/lavam/bin:$PATH
alias ci='cd /Users/lululi/apps/ci-publiccloud/setup_machine/python/'
alias vm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm"
export ci_dir="/Users/lululi/apps/ci-publiccloud/"
export RUN_UNITTEST=NO
export PATH=/usr/local/oushu/lavam/bin:$PATH
