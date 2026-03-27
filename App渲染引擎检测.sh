#---
# name: App渲染引擎检测
# author: Zeb
# brand: 未知
# description: 查看目标App是否使用Vulkan渲染引擎
#---
echo "=================================================="
echo "   🚀 App 渲染引擎状态检测"
echo "=================================================="

# 👇 【自定义配置区】在这里修改或添加你想要检测的包名，用空格隔开即可
TARGET_APPS="com.tencent.mobileqq com.tencent.mm com.coolapk.market com.taobao.taobao"

echo "📋 当前监听名单（QQ 微信 酷安 淘宝）："
echo "$TARGET_APPS"
echo ""
echo "--------------------------------------------------"
echo ""
# 开始遍历检测每个包名
for pkg in $TARGET_APPS; do
    # 针对特定包名抓取渲染信息
    RAW_OUTPUT=$(dumpsys gfxinfo $pkg | grep -E "Graphics info for|Pipeline=")

    if [ -z "$RAW_OUTPUT" ]; then
        echo "⚪ 📦 包名：$pkg"
        echo "   💤 状态：未运行，或当前没有可见的渲染界面"
    else
        echo "📱 📦 包名：$pkg"
        
        # 智能识别当前使用的引擎并打上Emoji标签
        if echo "$RAW_OUTPUT" | grep -q "Vulkan"; then
            echo "   🟢 引擎：Skia (Vulkan) 🎉 加速中"
        elif echo "$RAW_OUTPUT" | grep -q "OpenGL"; then
            echo "   🔵 引擎：Skia (OpenGL) 经典模式"
        else
            echo "   🟡 引擎：未知或未完全初始化"
        fi
        
        echo "   📄 [底层原始输出]："
        # 将原始输出稍微缩进排版，看起来更清晰
        echo "$RAW_OUTPUT" | while read -r line; do echo "  $line"; done
    fi
    echo ""
    echo "--------------------------------------------------"
    echo ""
done


echo ""
echo ""
echo ""
echo "⚠️ 【数据准确性警告】"
echo "渲染引擎是在 App 冷启动时确定的。如果该 App 之前一直在后台，"
echo "测出的可能是旧数据。为了保证 100% 准确，请务必："
echo "👉 将目标应用【强制停止】 -> 重新打开它 -> 再次运行本脚本！"
echo "=================================================="