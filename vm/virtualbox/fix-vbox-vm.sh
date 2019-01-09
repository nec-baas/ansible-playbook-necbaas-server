#!/bin/sh

if [ ! -f config.sh ]; then
    echo "Error: no config.sh"
    exit 1
fi
 
. ./config.sh

# VBOX VM の修正を行う（SSH 設定、管理者の追加と権限設定と不要なファイルの削除）
env ANSIBLE_SSH_ARGS="-o ControlPersist=0s" \
    ansible-playbook -i host ../../virtualbox.yml --skip-tags "virtualbox_remove_users" \
      -e vbox_mgr_username=$VBOX_MGR_USER \
      -e vbox_mgr_password=$VBOX_MGR_PASSWORD \
      -vvv

# VBOX VM に不要なユーザとその権限の削除。
# ただし、VBOX VM 管理者が指定されない場合、実行しない
if [ -n "$VBOX_MGR_USER" ]; then
env ANSIBLE_SSH_ARGS="$ANSIBLE_SSH_ARGS -o PasswordAuthentication=yes" \
    ansible-playbook -i host ../../virtualbox.yml --tags "virtualbox_remove_users" \
      -e ansible_ssh_user=$VBOX_MGR_USER \
      -e ansible_ssh_pass=$VBOX_MGR_PASSWORD \
      -e vbox_remove_users="[${VBOX_REMOVE_USERS}]" \
      -vvv
fi

echo "Fix vm done!"

