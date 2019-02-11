function ga(){}

const ap = new APlayer({
  container: document.getElementById('aplayer'),
  fixed: true,
  lrcType: 3,
  order: 'random',
  theme: '#000000',
  audio: getLove()
});

// 检测是否是手机查看，手机端默认关闭歌词
var sUserAgent = navigator.userAgent.toLowerCase();
var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
var bIsMidp = sUserAgent.match(/midp/i) == "midp";
var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
var bIsAndroid = sUserAgent.match(/android/i) == "android";
var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
  // 跳转移动端页面
  ap.lrc.toggle();
  $(".aplayer-icon-lrc").addClass("aplayer-icon-lrc-inactivity");
}
    
// 变化一次壁纸
var imageUrls = ['https://wang926454.gitee.io/reader/Image/201810/normal/20010.png',
              'https://wang926454.gitee.io/reader/Image/201811/normal/02015.png',
              'https://wang926454.gitee.io/reader/Image/201811/normal/05020.png',
              'https://wang926454.gitee.io/reader/Image/201812/normal/23005.png',
              'https://wang926454.gitee.io/reader/Image/201901/normal/16005.png'];
var indexImage = document.getElementById('indexImage');
var img = new Image();
var url = imageUrls[Math.floor(imageUrls.length * Math.random())];
img.src = url;
img.onload = function () {
  indexImage.style.backgroundImage = "url(" + url + ")";
}
    
// 3秒变化一次壁纸 推荐使用setTimeout
/* setTimeout(function () {
  indexImage = document.getElementById('indexImage');
  indexImage.style.backgroundImage = "url(" + imageUrls[Math.floor(imageUrls.length * Math.random())] + ")";
  setTimeout(arguments.callee, 5000);
}, 3000); */

// 隐藏Live2D
// $("#live2dcanvas").css("display", "none");

// 头像改变
var status = 1;
$("#myFace").on("click",function(){
  if(status == 1){
    $("#authorImage").attr("src", "https://wang926454.gitee.io/reader/Image/201811/normal/02005.png");
    $("#authorText").html("居然被你发现了~o(*////▽////*)o");
    $("#main").css("padding-bottom", "350px");
    $("#footerImage").css("display", "");
    // $("#live2dcanvas").css("display", "");
    status = 0
  }else{
    $("#authorImage").attr("src", "https://wang926454.gitee.io/reader/Image/201810/normal/20025.png");
    $("#authorText").html("只想每天开心的像个孩子");
    $("#main").css("padding-bottom", "130px");
    $("#footerImage").css("display", "none");
    // $("#live2dcanvas").css("display", "none");
    status = 1
  }
});