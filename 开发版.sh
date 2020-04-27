#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.250/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Bin AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
#添加额外软件包
svn co https://github.com/20088/openwrt-lienol/trunk/package/brook package/brook
svn co https://github.com/20088/openwrt-lienol/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/20088/openwrt-lienol/trunk/package/tcping package/tcping
git clone https://github.com/Repobor/luci-app-koolproxyR.git package/luci-app-koolproxyR
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
./scripts/feeds update -a
./scripts/feeds install -a
