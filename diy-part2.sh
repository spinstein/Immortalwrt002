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

# Modify default IP to avoid conflict
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Remove ALL themes (including bootstrap) and unnecessary UI components
find feeds/luci -type d -name "themes" -exec rm -rf {} + 2>/dev/null
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/applications/luci-app-vlmcsd
rm -rf feeds/luci/applications/luci-app-unblockmusic

# Remove auto-added theme dependencies
sed -i '/luci-theme/d' .config 2>/dev/null
