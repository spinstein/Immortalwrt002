#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 修改默认IP避免冲突
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 删除所有主题和无关UI组件
find feeds/luci -type d -name "themes" -exec rm -rf {} + 2>/dev/null
find . -name "luci-theme-*" -exec rm -rf {} + 2>/dev/null
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/applications/luci-app-vlmcsd
rm -rf feeds/luci/applications/luci-app-unblockmusic
rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-samba4

# 新增删除无关插件（确保系统精简）
rm -rf feeds/luci/applications/luci-app-arpbind
rm -rf feeds/luci/applications/luci-app-ddns
rm -rf feeds/luci/applications/luci-app-upnp
rm -rf feeds/luci/applications/luci-app-wol
rm -rf feeds/luci/applications/luci-app-accesscontrol
rm -rf feeds/luci/applications/luci-app-filetransfer
rm -rf feeds/luci/applications/luci-app-nlbwmon
rm -rf feeds/luci/applications/luci-app-adbyby-plus
rm -rf feeds/luci/applications/luci-app-frpc
rm -rf feeds/luci/applications/luci-app-frps

# 删除自动添加的主题依赖
sed -i '/luci-theme/d' .config 2>/dev/null
sed -i '/CONFIG_PACKAGE_luci-theme/d' .config 2>/dev/null

# 删除无关语言包
find . -name "luci-i18n-*" ! -name "*zh-cn*" -exec rm -rf {} + 2>/dev/null
