ulimit -n 65536
ulimit -c 10000000000
export CC=clang
export CXX=clang++
export HIVE_HOME=/Users/lululi/apps/hive
export DEPENDENCY_PATH=/opt/dependency/package
source /opt/dependency-Darwin/package/env.sh

export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.1/libexec 
export PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${HIVE_HOME}/bin
export JAVA_HOME=/usr/local/Cellar/openjdk@8/1.8.0+322/libexec/openjdk.jdk/Contents/Home
export dbversion='50'
if [ "$dbversion" = '50' ];then 
	source /usr/local/oushu/oushudb/oushudb_path.sh
elif [ "$dbversion" = '49' ];then
	source /usr/local/hawq/greenplum_path.sh
	alias oushudb='hawq'
fi
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bash_func='vim ~/.bash_function.sh'
alias source_rc='source  ~/.bashrc'
alias oushu_init='oushudb init cluster --with_magma -a'
source /Users/lululi/.bash_function.sh
source /Users/lululi/.git-completion.bash
TEST_DB_NAME="postgres"

mkdir -p /tmp/magma_catalog
mkdir -p /tmp/magma_data
alias lgt="ssh lululi@101.43.188.6"
alias oushu='cd /usr/local/oushu/'
export PATH=/usr/local/oushu/lavam/bin/:/usr/local/mysql/bin/:$PATH
export LAVA_USER="lilulu@oushutest"
export LAVA_PASSWORD="qminet8r5h"
alias startvm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --multicreate 3,3"
alias listvm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu|awk '{print $4}'"
alias listall="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list"
alias listlll="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lll"
alias listci_vm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lll|awk '{print $4}'"
alias startvm_debug="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --multicreate 3,3 --testbinary debug"
alias ci='cd /Users/lululi/apps/ci-publiccloud/setup_machine/python/'
alias vm="python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm"
export ci_dir="/Users/lululi/apps/ci-publiccloud/"
export RUN_UNITTEST=NO
alias lldb_postgres='ps -ef'
alias conf="cd /usr/local/oushu/conf/oushudb"
alias conf="cd /usr/local/oushu/log/oushudb"
alias buildandrun='cd ~/oushudb/hornet-opensource/build && make debug -j8 && cd ../../hornet/build && make debug -j8 && cd ../../hawq && make -j8 && make -j8 install && reinitmagma'
export PATH="/usr/local/opt/libtool/libexec/gnubin:$PATH"
export HEAP_PROFILE_ALLOCATION_INTERVAL=1048576
alias home='ssh van@192.168.1.222'
alias kpadmin="ssh gpadmin@192.168.1.163"
alias kpoushu="ssh oushu@192.168.1.163"
alias tb='ssh gpadmin@52.131.104.81 -p 1233'
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PGDATABASE=postgres
export HADOOP_CONF_DIR=/usr/local/Cellar/hadoop/3.3.1/libexec/etc/hadoop/
export http_proxy=http://127.0.0.1:4780
export https_proxy=http://127.0.0.1:4780
export ALL_PROXY=socks5://127.0.0.1:4781
#alias find-merge="!sh -c 'commit=$0 && branch=${1:-HEAD} && (git rev-list $commit..$branch --ancestry-path | cat -n; git rev-list $commit..$branch --first-parent | cat -n) | sort -k2 -s | uniq -f1 -d | sort -n | tail -1 | cut -f2'"
#alias show-merge="!sh -c 'merge=$(git find-merge $0 $1) && [ -n \"$merge\" ] && git show $merge'"
alias cdhawq='cd ~/oushudb/hawq'
alias cdhornet='cd ~/oushudb/hornet'
alias cdopensource='cd ~/oushudb/hornet-opensource'
alias mkcd='mkdir -p  build && cd build'
alias makecleanall='cdopensource && git clean -xdf && mkcd && ../bootstrap&& make debug -j && cdhornet && git clean -xdf && mkcd && ../bootstrap && make debug -j&& cdhawq && git clean -xdf && ./configure --enable-debug --enable-cassert && make -j && make install'
alias makereleasecleanall='cdopensource && git clean -xdf && mkcd && ../bootstrap&& make release -j && cdhornet && git clean -xdf && mkcd && ../bootstrap && make release -j&& cdhawq && git clean -xdf && ./configure  && make -j && make install -j'
alias restart='oushudb restart cluster -a'
alias makeall='make_opensource && make_hornet && make_hawq && make install -j8'
alias makedebugall='make_debug_opensource && make_debug_hornet && make_debug_hawq && make install -j8'
alias kp3='sshpass -p Admin@220817 ssh -o StrictHostKeyChecking=no -p 3473 oushu@42.193.136.114'
pass=Pj8fUeosnH4PfIdpR9
alias ftest='cd /Users/lululi/oushudb/hawq/src/test/feature/'
