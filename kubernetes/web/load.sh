#!/bin/bash -x

repeat_num () 
{ 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
	echo -n "$i. "
        eval "$@";
    done
}

repeat_num 2000 'curl http://a68535e08bdd040e9aef62d22c703f11-1918800636.us-west-2.elb.amazonaws.com:8081/list'
