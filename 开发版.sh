#!/bin/bash
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/Bin AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
#添加额外软件包
svn co https://github.com/20088/openwrt-lienol/trunk/package/brook package/brook
svn co https://github.com/20088/openwrt-lienol/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/20088/openwrt-lienol/trunk/package/tcping package/tcping
svn co https://github.com/20088/openwrt-lienol/trunk/lienol/luci-app-passwall package/luci-app-passwall
git clone https://github.com/bin20088/luci-theme-argon-mc.git package/luci-theme-argon-mc
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/Repobor/luci-app-koolproxyR.git package/luci-app-koolproxyR
./scripts/feeds update -a
./scripts/feeds install -a
