#!/bin/sh

if [ ! -f config.sh ]; then
    echo "Error: no config.sh"
    exit 1
fi
 
. ./config.sh

TOPDIR=work/$VER
DESTDIR=out/$VER
OVA_FILE=${VBOX_VM_NAME}.ova

echo "### Setup working dir : $TOPDIR ###"
/bin/rm -rf $TOPDIR
mkdir -p $TOPDIR

echo "### Setup　out dir : $DESTDIR ###"
/bin/rm -rf $DESTDIR
mkdir -p $DESTDIR

# VM の停止
echo "### Halt vagrant vm: $SERVER_VM_NAME ###"
vagrant halt -f "$SERVER_VM_NAME"

# VM の BOX 化
echo "### Packaged vagrant vm:$SERVER_VM_NAME. Take a long time.  ###"
vagrant package "$SERVER_VM_NAME" --output "$TOPDIR/temp.box"

# vagrant BOX の展開
(cd $TOPDIR && tar xvf temp.box)

# 作成しようとする VBOX VM が既に存在する場合は、強制終了
vboxmanage showvminfo "$VBOX_VM_NAME" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "error: VirtualBox VM($VBOX_VM_NAME) already exists. "
    exit 1
fi

# VBOX VM のインポート、設定(vmname、memory)
(cd $TOPDIR \
    && vboxmanage import box.ovf --vsys 0 --vmname "$VBOX_VM_NAME" \
                                          --memory $VBOX_VM_MEMORY \
                                          --unit 9 --disk $TOPDIR/disk/box-disk001.vmdk
)

# VBOX VM の NAT のポートフォワディング設定
for i in $VBOX_NAT_PORT_FORWARDING; do
    vboxmanage modifyvm "$VBOX_VM_NAME" --natpf1 $i
done
# 不要ネットワークインターフェースの削除
vboxmanage modifyvm "$VBOX_VM_NAME" --nic2 none

# VBOX VM のエクスポート
echo "### Export VirtualBox VM: $VBOX_VM_NAME. ###"
vboxmanage export "$VBOX_VM_NAME" -o "$DESTDIR/$OVA_FILE" --vsys 0 \
                                --product "$VBOX_PRODUCT" \
                                --producturl "$VBOX_PRODUCT_URL" \
                                --vendor "$VBOX_VENDOR" \
                                --vendorurl "$VBOX_VENDOR_URL" \
                                --version "$VBOX_VERSION" \
                                --description "$VBOX_DESCRIPTION"

# 作業用 VBOX VM の削除
vboxmanage unregistervm "$VBOX_VM_NAME" --delete

echo "Export vbox vm done."


