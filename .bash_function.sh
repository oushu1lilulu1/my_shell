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
hdfs dfs -rm -r /hawq*
rm -rf /usr/local/oushu/log/oushudb/*
rm -rf /tmp/magma_catalog/*
rm -rf /tmp/magma_data/*
rm -rf ~/hawq-data-directory/
}

function oushu_killall {
ps -ef | grep postgres | grep -v grep | awk '{print $2}'| xargs kill -9
ps -ef | grep magma | grep -v grep | awk '{print $2}'| xargs kill -9
oushudb ps
}

function v {
file_name=${1#*-}
vim ${file_name}
}

function reinit {
echo "************************kill all***************************"
oushu_killall 
echo "**************************clean****************************"
oushu_clean 
echo "**************************Iinit****************************"
oushu_init
}

function oushu_make {
dir=`pwd`
res=expr index ${dir} "debug"
if [ 0=${res} ];then
	echo "You are not in debug directory,please checkout to debug directory and retry!"
else
	make debug -j8
fi
}

function log {
vim /usr/local/oushu/log/oushudb/
}

function deletevm {
python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lululi |awk '{print $4}' |xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --deletevm

rm -rf /Users/lululi/apps/ci-publiccloud/setup_machine/clusterid
}

function vm1 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
for x in ${ip_array[@]};
do
echo $x
done
echo "sshpass -p ${password_array[1]} ssh -o StrictHostKeyChecking=no  oushu@${ip_array[1]}" 
sshpass -p ${password_array[1]}  ssh oushu@${ip_array[1]} 
}
function vm2 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
echo "sshpass -p ${password_array[2]} ssh -o StrictHostKeyChecking=no   oushu@${ip_array[2]}"
sshpass -p ${password_array[2]}  ssh oushu@${ip_array[2]}
}
function vm3 {
ip_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $8}'))
password_array=($(python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --list|grep lulu| awk '{print $4}'|xargs python /Users/lululi/apps/ci-publiccloud/setup_machine/python/setup.py --listvm |awk '{print $12}'))
echo "sshpass -p ${password_array[3]} ssh -o StrictHostKeyChecking=no   oushu@${ip_array[3]}"
sshpass -p ${password_array[3]}  ssh oushu@${ip_array[3]}
}

function latestvm {
id=`cat $ci_dir/setup_machine/clusterid`
：
}
