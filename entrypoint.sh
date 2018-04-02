#!/bin/bash

cmd="$@"

echo ">>>>> PID VERIFICATION <<<<<"
pidfiles="tmp/pids/*.*"
rm -rf $pidfiles
echo "PID folder cleaned!"


echo ">>>>> DATABASE VERIFICATION <<<<<"
if bundle exec rake db:exists; then
    echo ">>>>> DATABASE DETECTED APPLYING MIGRATIONS <<<<<"
    bundle exec rake db:migrate
else
    echo ">>>>> NO DATABASE DETECTED CREATING A NEW ONE <<<<<"
    bundle exec rake db:create
    bundle exec rake db:migrate
fi

exec $cmd
