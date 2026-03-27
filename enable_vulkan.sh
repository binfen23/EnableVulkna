#---
#name: 开启 Vulkan 渲染加速
#author: Zeb
#description: 全局应用开启 Vulkan (SkiaVK) 加速
#---

echo "=================================================="
echo "   🚀 尝试开启 Vulkan (SkiaVK) 硬件加速模式"
echo "=================================================="

# 尝试设置系统属性
setprop debug.hwui.renderer skiavk >/dev/null 2>&1
setprop debug.renderengine.backend skiavk >/dev/null 2>&1

# 读取真实生效的值
engine1=$(getprop debug.renderengine.backend)
engine2=$(getprop debug.hwui.renderer)

if [ -z "$engine1" ]; then engine1="未生效(无权限或不支持)"; fi
if [ -z "$engine2" ]; then engine2="未生效(无权限 or 不支持)"; fi

echo "✅ debug.renderengine.backend：$engine1"
echo "✅ debug.hwui.renderer：$engine2"
echo ""
echo "✨ 若显示为 skiavk 即开启成功，正在运行的应用重启后生效。"
echo "=================================================="