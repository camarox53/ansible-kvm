#! /usr/bin/env bash

echo "Putting SSH keys in place"
echo " "

while IFS='' read -r line || [[ -n "$line" ]] ; do
    user=$(echo $line | cut -d ':' -f1)
    echo "Creating user: $user"
    adduser -m -s /bin/bash -d /home/${user} ${user}
    mkdir -p /home/${user}/.ssh
    chown ${user}:${user} /home/${user}
    chmod u+rwx /home/${user}
    sshkey=`grep ${user} /tmp/authorized_keys | cut -d":" -f2`
    echo ${sshkey} > /home/${user}/.ssh/authorized_keys
    chown -R ${user}:${user} /home/${user}/.ssh
    chmod -R 700 /home/${user}/.ssh
    
done < "$1"

echo " "
echo "Keys put in place"
