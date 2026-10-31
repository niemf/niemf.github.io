@echo off
chcp 65001 >nul
REM ============================================
REM  niemf 博客一键发布脚本（单分支方案）
REM  功能：清理 -> 生成 -> git 提交推送
REM ============================================
cd /d "%~dp0"

echo.
echo [1/4] 清理旧文件...
call npx hexo clean

echo.
echo [2/4] 生成静态站点...
call npx hexo generate
if errorlevel 1 (
    echo [错误] 生成失败，请检查错误信息。
    pause
    exit /b 1
)

echo.
echo [3/4] 提交到 Git...
git add -A
git commit -m "Site updated: %date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,5%" 2>nul
if errorlevel 1 (
    echo [提示] 没有需要提交的变更。
)

echo.
echo [4/4] 推送到 GitHub...
git push origin main
if errorlevel 1 (
    echo [错误] 推送失败，请检查网络或 Git 凭据。
    pause
    exit /b 1
)

echo.
echo ============================================
echo  发布完成！访问 https://niemf.github.io
echo ============================================
pause
