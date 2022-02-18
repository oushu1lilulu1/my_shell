ulimit -n 65536
ulimit -c 10000000000
export CC=clang
export CXX=clang++
export DEPENDENCY_PATH=/opt/dependency/package
source /opt/dependency-Darwin/package/env.sh

export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.1/libexec 
export PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
export JAVA_HOME=/usr/local/Cellar/openjdk@8/1.8.0+312/libexec/openjdk.jdk/Contents/Home
source /Users/lululi/.bash_function.sh
source /usr/local/oushu/oushudb/oushudb_path.sh
export DYLD_LIBRARY_PATH=/opt/dependency-Darwin/package/lib:$DYLD_LIBRARY_PATH
alias goproxy='export http_proxy=http://127.0.0.1:4780 https_proxy=http://127.0.0.1:4780'
alias disproxy='unset http_proxy https_proxy'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bash_func='vim ~/.bash_function.sh'
alias source_rc='source  ~/.bashrc'
