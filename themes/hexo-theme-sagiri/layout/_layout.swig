<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  <style> #live2dcanvas { left: -10px!important; bottom: 30px!important; }</style>
  {% include '_third-party/analytics/index.swig' %}
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
  <script src="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}

  <div id="aplayer"></div>

  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-image"></div>
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}

    <canvas id="evanyou"></canvas>

    {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
      <div id="needsharebutton-float">
        <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
      </div>
    {% endif %}

  </div>

  <script type="text/javascript" src="{{ url_for(theme.js) }}/sagiri.min.js?v={{ theme.version }}"></script>

  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
  {{ live2d() }}
  <script>
    const ap = new APlayer({
      container: document.getElementById('aplayer'),
      fixed: true,
      lrcType: 3,
      order: 'random',
      theme: '#000000',
      volume: 2.0,
      audio: [
        {
          name: 'Waiting For Love',
          artist: 'Avicii',
          url: 'https://res.wang64.cn/Music/waitingforlove.mp3',
          cover: 'https://res.wang64.cn/Music/image/waitingforlove.png',
          lrc: 'https://res.wang64.cn/Music/lrc/waitingforlove.lrc'
        },
        {
          name: 'Nevada',
          artist: 'Vicetone/Cozi Zuehlsdorff',
          url: 'https://res.wang64.cn/Music/nevada.mp3',
          cover: 'https://res.wang64.cn/Music/image/nevada.png',
          lrc: 'https://res.wang64.cn/Music/lrc/nevada.lrc'
        },
        {
          name: 'Aeon',
          artist: 'JJD',
          url: 'https://res.wang64.cn/Music/aeon.mp3',
          cover: 'https://res.wang64.cn/Music/image/aeon.png',
          lrc: 'https://res.wang64.cn/Music/lrc/aeon.lrc'
        },
        {
          name: 'Trip',
          artist: 'Axero',
          url: 'https://res.wang64.cn/Music/trip.mp3',
          cover: 'https://res.wang64.cn/Music/image/trip.png',
          lrc: 'https://res.wang64.cn/Music/lrc/trip.lrc'
        },
        {
          name: 'Horizon',
          artist: 'Janji',
          url: 'https://res.wang64.cn/Music/horizon.mp3',
          cover: 'https://res.wang64.cn/Music/image/horizon.png',
          lrc: 'https://res.wang64.cn/Music/lrc/horizon.lrc'
        },
        {
          name: '五月雨变奏电音',
          artist: '者思范Remix',
          url: 'https://res.wang64.cn/Music/wuyueyu.mp3',
          cover: 'https://res.wang64.cn/Music/image/wuyueyu.png',
          lrc: 'https://res.wang64.cn/Music/lrc/wuyueyu.lrc'
        },
        {
          name: 'Sunburst(亚索台词版)',
          artist: 'Goi7',
          url: 'https://res.wang64.cn/Music/sunburst.mp3',
          cover: 'https://res.wang64.cn/Music/image/sunburst.png',
          lrc: 'https://res.wang64.cn/Music/lrc/sunburst.lrc'
        },
        {
          name: 'Legends Never Die(Remix)',
          artist: 'Alan Walker',
          url: 'https://res.wang64.cn/Music/legendsneverdie.mp3',
          cover: 'https://res.wang64.cn/Music/image/legendsneverdie.png',
          lrc: 'https://res.wang64.cn/Music/lrc/legendsneverdie.lrc'
        },
        {
          name: 'RISE 登峰造极境',
          artist: '英雄联盟',
          url: 'https://res.wang64.cn/Music/rise.mp3',
          cover: 'https://res.wang64.cn/Music/image/rise.png',
          lrc: 'https://res.wang64.cn/Music/lrc/rise.lrc'
        },
        {
          name: '光るなら',
          artist: 'Goose house',
          url: 'https://res.wang64.cn/Music/goosehouseguang.mp3',
          cover: 'https://res.wang64.cn/Music/image/goosehouseguang.png',
          lrc: 'https://res.wang64.cn/Music/lrc/goosehouseguang.lrc'
        },
        {
          name: '風に薫る夏の記憶',
          artist: 'AAA',
          url: 'https://res.wang64.cn/Music/aaa.mp3',
          cover: 'https://res.wang64.cn/Music/image/aaa.png',
          lrc: 'https://res.wang64.cn/Music/lrc/aaa.lrc'
        },
        {
          name: '永久指针',
          artist: '海贼王',
          url: 'https://res.wang64.cn/Music/yongjiuzhizhen.mp3',
          cover: 'https://res.wang64.cn/Music/image/yongjiuzhizhen.png',
          lrc: 'https://res.wang64.cn/Music/lrc/yongjiuzhizhen.lrc'
        },
        {
          name: '一直很安静',
          artist: '阿桑',
          url: 'https://res.wang64.cn/Music/yizhihenanjing.mp3',
          cover: 'https://res.wang64.cn/Music/image/yizhihenanjing.png',
          lrc: 'https://res.wang64.cn/Music/lrc/yizhihenanjing.lrc'
        },
        {
          name: '侧脸',
          artist: '于果',
          url: 'https://res.wang64.cn/Music/celian.mp3',
          cover: 'https://res.wang64.cn/Music/image/celian.png',
          lrc: 'https://res.wang64.cn/Music/lrc/celian.lrc'
        },
        {
          name: '从别后(Tvsize)',
          artist: '流浪的蛙蛙',
          url: 'https://res.wang64.cn/Music/congbiehou.mp3',
          cover: 'https://res.wang64.cn/Music/image/congbiehou.png',
          lrc: 'https://res.wang64.cn/Music/lrc/congbiehou.lrc'
        }]
    });
    // 默认关闭歌词
    ap.lrc.toggle();
    $(".aplayer-icon-lrc").addClass("aplayer-icon-lrc-inactivity");
  </script>
</body>
</html>
<!-- 页面点击小红心 -->
<script type="text/javascript" src="https://article.wang64.cn/js/src/love.js"></script>
