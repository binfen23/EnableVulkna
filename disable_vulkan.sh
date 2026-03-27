#---
#name: 恢复默认渲染引擎
#author: Zeb
#description: 恢复为系统默认的 OpenGL (SkiaGL) 后端
#---

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
echo "🔄 已执行恢复指令，重启应用后生效。"
echo "=================================================="