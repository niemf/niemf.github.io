/* 让整站固定背景跟随当前页面的 banner 图，实现「背景不变、文字滑动」的视差效果 */
(function () {
  function syncBg() {
    var header = document.getElementById('page-header');
    if (!header) return;
    // 读取 page-header 的内联背景图
    var bg = header.style.backgroundImage;
    if (!bg || bg === 'none') return;

    // 确保存在 #web_bg 层（若主题未生成则动态创建）
    var webBg = document.getElementById('web_bg');
    if (!webBg) {
      webBg = document.createElement('div');
      webBg.id = 'web_bg';
      document.body.appendChild(webBg);
    }
    webBg.style.backgroundImage = bg;
    webBg.style.backgroundSize = 'cover';
    webBg.style.backgroundPosition = 'center';
    webBg.style.backgroundRepeat = 'no-repeat';
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', syncBg);
  } else {
    syncBg();
  }
})();
