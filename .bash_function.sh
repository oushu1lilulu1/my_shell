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
}

function oushu_killall {
ps -ef | grep postgres | grep -v grep | awk '{print $2}'| xargs kill -9
ps -ef | grep magma | grep -v grep | awk '{print $2}'| xargs kill -9
}

function v {
file_name=${1#*-}
vim ${file_name}
}

