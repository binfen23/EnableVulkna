#---
#name: App渲染引擎切换Vulkan
#author: Zeb
#brand: 通用
#description: 全局应用开启 Vulkan (SkiaVK) 加速 (应用停止运行后重启生效)
#---

#on
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
if [ -z "$engine2" ]; then engine2="未生效(无权限或不支持)"; fi

echo "✅ debug.renderengine.backend：$engine1"
echo "✅ debug.hwui.renderer：$engine2"
echo ""
echo "✨ 若显示为 skiavk 即开启 Vulkan 成功，正在运行的应用重启后生效。"
echo "=================================================="


#off
echo ""
echo "=================================================="
echo "   🎨 尝试恢复默认渲染引擎 (SkiaGL)"
echo "=================================================="

# 恢复为 OpenGL 后端
setprop debug.hwui.renderer skiagl >/dev/null 2>&1
setprop debug.renderengine.backend skiagl >/dev/null 2>&1

# 读取真实生效的值
engine1=$(getprop debug.renderengine.backend)
engine2=$(getprop debug.hwui.renderer)

if [ -z "$engine1" ]; then engine1="系统默认"; fi
if [ -z "$engine2" ]; then engine2="系统默认"; fi

echo "✅ debug.renderengine.backend：$engine1"
echo "✅ debug.hwui.renderer：$engine2"
echo ""
echo "🔄 已执行恢复指令"
echo "=================================================="