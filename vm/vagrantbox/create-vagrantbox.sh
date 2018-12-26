#!/bin/sh

if [ ! -f config.sh ]; then
    echo "Error: no config.sh"
    exit 1
fi

. ./config.sh

DESTDIR=out/$VER

echo "### Setup　out dir : $DESTDIR ###"
/bin/rm -rf $DESTDIR
mkdir -p $DESTDIR

# 不要なファイルの削除
env ANSIBLE_SSH_ARGS="-o ControlPersist=0s" \
    ansible-playbook ../../vagrantbox.yml \
    --extra-vars "vagrantbox_host=$SERVER_VM_NAME" \
    -v

# VM の停止
echo "### Halt vagrant vm: $SERVER_VM_NAME ###"
vagrant halt -f "$SERVER_VM_NAME"

# VM の BOX 化
echo "### Packaged vagrant vm:$SERVER_VM_NAME. Take a long time.  ###"
vagrant package $SERVER_VM_NAME --output "$DESTDIR/${VAGRANT_BOX_NAME}.box"

echo "Export done."

