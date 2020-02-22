#!/bin/bash
#add fix to exercise6-fix here
HOST=$(hostname)
server2P="server2"
server1P="server1"


if [ "$HOST" == "$server1P" ] ##note the space after the string you are searching for
then
HOST="server2"
echo $HOST

elif [  "$HOST" == "$server2P" ]
then
HOST="server1"
echo $HOST

else
    echo "This script is not familiar with this ip. In order to add it, edit the shell script of exercise6-fix and add this ip to the if condition"
fi

#echo "echo hello world" >>  /home/vagrant/file1.sh
File_1_path=$1
Path=$2
my_array=($File_1_path $Path)


#pv -size | scp  ${my_array[0]} server2:${my_array[1]}
rsync -rt   ${my_array[0]}  $HOST:${my_array[1]} --stats | grep  "Total bytes sent" | sed 's/[^0-9]*//g'


if [ -f "exercise6-fix.sh" ]
then
echo "file/s allready exist"
 else
  echo "if [ /"$HOST/" == /"$server1P/" ]">>  /home/vagrant/exercise6-fix.sh
fi
