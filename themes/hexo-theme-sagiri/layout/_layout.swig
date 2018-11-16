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
  <style>
    .aplayer.aplayer-fixed .aplayer-lrc {
      text-shadow: none;
    }
  </style>
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
      <div id="footerImage" class="footer-image" style="display: none;"></div>
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
  <script type="text/javascript" src="https://wang926454.gitee.io/reader/JS/aplist.js"></script>
  <script>
    function ga(){}

    const ap = new APlayer({
      container: document.getElementById('aplayer'),
      fixed: true,
      lrcType: 3,
      order: 'random',
      theme: '#000000',
      volume: 2.0,
      audio: getLove()
    });
    // 默认关闭歌词
    ap.lrc.toggle();
    $(".aplayer-icon-lrc").addClass("aplayer-icon-lrc-inactivity");
    
    // 3秒变化一次壁纸
    var imageUrls = ['https://wang926454.gitee.io/reader/Image/201810/normal/20010.png',
                  'https://wang926454.gitee.io/reader/Image/201811/normal/02015.png',
                  'https://wang926454.gitee.io/reader/Image/201811/normal/05020.png',
                  'https://wang926454.gitee.io/reader/Image/201811/normal/05005.png',
                  'https://wang926454.gitee.io/reader/Image/201811/normal/05030.png'];
    var indexImage = document.getElementById('indexImage');
    // 推荐使用setTimeout
    setTimeout(function () {
      indexImage = document.getElementById('indexImage');
      indexImage.style.backgroundImage = "url(" + imageUrls[Math.floor(imageUrls.length * Math.random())] + ")";
      setTimeout(arguments.callee, 5000);
    }, 3000);

    // 隐藏Live2D
    $("#live2dcanvas").css("display", "none");

    // 头像改变
    var status = 1;
    $("#myFace").on("click",function(){
      if(status == 1){
        $("#authorImage").attr("src", "https://wang926454.gitee.io/reader/Image/201811/normal/02005.png");
        $("#authorText").html("居然被你发现了~o(*////▽////*)o");
        $("#main").css("padding-bottom", "350px");
        $("#footerImage").css("display", "");
        $("#live2dcanvas").css("display", "");
        status = 0
      }else{
        $("#authorImage").attr("src", "https://wang926454.gitee.io/reader/Image/201810/normal/20025.png");
        $("#authorText").html("只想每天开心的像个孩子");
        $("#main").css("padding-bottom", "130px");
        $("#footerImage").css("display", "none");
        $("#live2dcanvas").css("display", "none");
        status = 1
      }
    });
  </script>
  <!-- 页面点击小红心 -->
  <script type="text/javascript" src="https://wang926454.gitee.io/reader/JS/love.js"></script>
</body>
</html>
