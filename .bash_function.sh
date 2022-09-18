function git_branch {
    branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
    if [ "${branch}" != "" ];then
        if [ "${branch}" = "(no branch)" ];then
            branch="(`git rev-parse --short HEAD`...)"
        fi
        echo " ($branch)"
    fi
}
export PS1='\u@\h \[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\] \$ '

function oushu_clean {
hdfs dfs -rm -r /hdfs*
hdfs dfs -rm -r /hawq*
rm -rf /usr/local/oushu/log/oushudb/*
rm -rf /Users/lululi/magma/magma_catalog/*
rm -rf /Users/lululi/magma/magma_data/*
rm -rf /Users/lululi/magma/magma_catalog1/*
rm -rf /Users/lululi/magma/magma_catalog2/*
rm -rf /Users/lululi/magma/magma_catalog3/*
rm -rf ~/hawq-data-directory/
}

function oushu_killall {
ps -ef | grep postgres | grep -v grep | awk '{print $2}'| xargs kill -9
ps -ef | grep magma | grep -v grep | awk '{print $2}'| xargs kill -9
if [ "$dbversion" = '50' ];then
    oushudb ps
elif [ "$dbversion" = '49' ];then
    hawq ps
fi
}

function ssh_vm {
   	ip=$1
	password=$2
sshpass -p ${password}  ssh -o StrictHostKeyChecking=no oushu@${ip} 
}

function v {
file_name=${1#*-}
vim ${file_name}
}

function free_shared_mem {
ipcs -m | cut -f2 -d' ' | xargs -I {} sudo ipcrm -m {}
}

function reinitmagma {

echo "************************kill all***************************"
oushu_killall 
echo "**************************clean****************************"
oushu_clean 
#echo "**************************free****************************"
#free_shared_mem
echo "**************************Iinit****************************"
oushu_init
}

function oushu_make {
dir=`pwd`
res=expr index ${dir} "build"
if [ 0=${res} ];then
	echo "You are not in build directory,please checkout to build directory and retry!"
else
	make debug -j8
fi
}

function log {
cd /usr/local/oushu/log/oushudb/
}

function deletevm {
if [ -x $1 ];then

	python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lululi |awk '{print $4}' |xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --deletevm

	rm -rf /Users/lululi/apps/ci-publiccloud/setup_machine/clusterid
 else

	for x in ${@};
	do 
		python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --deletevm $x
	done

fi
}


function vm1 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
for x in ${ip_array[@]};
do
echo $x
done
echo "sshpass -p ${password_array[1]} ssh -o StrictHostKeyChecking=no  oushu@${ip_array[1]}" 
sshpass -p ${password_array[1]}  ssh -o StrictHostKeyChecking=no oushu@${ip_array[1]} 
}
function vm2 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
echo "sshpass -p ${password_array[2]} ssh -o StrictHostKeyChecking=no   oushu@${ip_array[2]}"
sshpass -p ${password_array[2]}  ssh -o StrictHostKeyChecking=no oushu@${ip_array[2]}
}
function vm3 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
echo "sshpass -p ${password_array[3]} ssh -o StrictHostKeyChecking=no   oushu@${ip_array[3]}"
sshpass -p ${password_array[3]}  ssh -o StrictHostKeyChecking=no oushu@${ip_array[3]}
}

function latestvm {
id=`cat $ci_dir/setup_machine/clusterid`
}

function reinit {
ps -ef | grep postgres | grep -v grep | awk '{print $2}'| xargs kill -9
echo "**************************free****************************"
free_shared_mem
oushudb ps
rm -rf ~/hawq-data-directory/*
rm -rf /usr/local/oushu/log/oushudb/*
oushudb init cluster -a
}

function pull_all_master {
 cd ~/oushudb/hornet-opensource
 git checkout master
 git pull
 git checkout -
 cd ../hornet
 git checkout master
 git pull
 git checkout -
 cd ../hawq 
 git checkout oushu-master
 git pull
 git checkout -
}
function lldb_latest {
lldb -c `ls -lat /cores/*|head -n1|awk '{print $9}'`
}

function make_opensource {
	cd ~/oushudb/hornet-opensource/build
	make -j
}
function make_hornet {
	cd ~/oushudb/hornet/build
	make -j
}

function make_hawq {
	cd ~/oushudb/hawq
	make -j
}
function make_debug_opensource {
	cd ~/oushudb/hornet-opensource/build
	make debug -j
}
function make_debug_hornet {
	cd ~/oushudb/hornet/build
	make debug -j
}

function make_debug_hawq {
	cd ~/oushudb/hawq
	make  -j
}


function f ()
{
 ps -caxm -orss= | awk '{ sum += $1 } END { print "Resident Set Size: " sum/1024 " MiB" }'
}

function git_remove_proxy ()
{
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  git config --global  --list
}
function git_add_proxy ()
{
  git config --global   http.proxy 127.0.0.1:4780
  git config --global  https.proxy 127.0.0.1:4780
  git config --global  --list
}

function git_remove_branch ()
{
  localbname=`git branch -a |grep lll|grep -v '/origin/'`
  for bname in ${localbname};
  do
     git branch -D $bname
  done
  remotebname=`git branch -a |grep '/origin/lll'`
  for bname in ${remotebname};
  do
    bname=`echo -n $bname|awk -F/ '{print $3}'`
    git push origin --delete $bname
  done
}

function create_branch ()
{
 cd ~/oushudb/hawq
 git checkout oushu-master
 git checkout -b $1 
 cd ~/oushudb/hornet
 git checkout master
 git checkout -b $1 
 cd ~/oushudb/hornet-opensource
 git checkout master
 git checkout -b $1 
}
function checkout_branch ()
{
 branch_name=$1 
 hawq_branch_name=$1 
 cd ~/oushudb/hawq
 result=$(echo ${branch_name} | grep "master")
 if [[ "${result}" != "" ]]
 then
     hawq_branch_name="oushu-master"
     branch_name="master"
 fi
 git checkout ${hawq_branch_name}
 cd ~/oushudb/hornet
 git checkout ${branch_name}
 cd ~/oushudb/hornet-opensource
 git checkout ${branch_name}
}
function ftest ()
{
	if [ -f "/Users/lululi/oushudb/hawq/src/test/feature/feature-test" ];
	then 
		/Users/lululi/oushudb/hawq/src/test/feature/feature-test --gtest_filter=$1
	else
		cd /Users/lululi/oushudb/hawq/
		make feature-test
		/Users/lululi/oushudb/hawq/src/test/feature/feature-test --gtest_filter=$1
	fi
}	
