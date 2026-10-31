@echo off
chcp 65001 >nul
REM ============================================
REM  niemf 博客一键发布脚本（双分支方案）
REM  功能：清理 -> 生成 -> 部署(推送到 gh-pages)
REM  源码提交到 main 分支需单独 git push
REM ============================================
cd /d "%~dp0"

echo.
echo [1/3] 清理旧文件...
call npx hexo clean

echo.
echo [2/3] 生成静态站点...
call npx hexo generate
if errorlevel 1 (
    echo [错误] 生成失败，请检查错误信息。
    pause
    exit /b 1
)

echo.
echo [3/3] 部署到 gh-pages 分支...
call npx hexo deploy
if errorlevel 1 (
    echo [错误] 部署失败，请检查网络或 Git 配置。
    pause
    exit /b 1
)

echo.
echo ============================================
echo  发布完成！访问 https://niemf.github.io
echo ============================================
pause
