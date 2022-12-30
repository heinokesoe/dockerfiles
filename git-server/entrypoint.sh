#!/bin/sh

chown -R git:git ~git
chmod 0750 ~git
if [ -n "$CGIT_CLONE_PREFIX" ]; then
    echo "clone-prefix=$CGIT_CLONE_PREFIX" >> /etc/cgitrc
fi
if [ -n "$CGIT_ROOT_TITLE" ]; then
    echo "root-title=$CGIT_ROOT_TITLE" >> /etc/cgitrc
fi
if [ -n "$CGIT_ROOT_DESCRIPTION" ]; then
    echo "root-desc=$CGIT_ROOT_DESCRIPTION" >> /etc/cgitrc
fi
if [ ! -d /var/lib/git/repositories ]; then
    if [ ! -f /etc/ssh/ssh_host_rsa_key.pub ]; then
        ssh-keygen -A
    fi
    echo "$SSH_KEY" > "/tmp/${SSH_KEY_NAME}.pub"
    su git -c "gitolite setup -pk /tmp/${SSH_KEY_NAME}.pub && git config --global init.defaultBranch main"
    rm "/tmp/${SSH_KEY_NAME}.pub"
    cp /etc/gitoliterc ~git/.gitolite.rc
    chmod 600 ~git/.gitolite.rc
    chown git:git ~git/.gitolite.rc
    ROOT_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
    echo root:$ROOT_PASSWORD | chpasswd
    echo $ROOT_PASSWORD > /etc/ssh/.rootpasswd
    GIT_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
    echo git:$GIT_PASSWORD | chpasswd
    echo $GIT_PASSWORD > /etc/ssh/.gitpasswd
else
    ROOT_PASSWORD=$(cat /etc/ssh/.rootpasswd)
    echo root:$ROOT_PASSWORD | chpasswd
    GIT_PASSWORD=$(cat /etc/ssh/.gitpasswd)
    echo git:$GIT_PASSWORD | chpasswd
fi
/usr/sbin/sshd -f /etc/sshd_config
lighttpd -D -f /etc/lighttpd/lighttpd.conf
