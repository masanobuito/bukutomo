// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap
//= require_tree .

// スムーススクロール
$(function(){
    $('a[href^="#"]').click(function(){
        var speed = 500;
        var href= $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({scrollTop:position}, speed, "swing");
        return false;
    });
});


// マウスオーバーで画像拡大　class="magnify" がついてる画像
$(function(){
    $(window).load(function(){
        var thumbSize = 175;      //拡大前
        var magnifySize = 250;    //拡大後
 
        $(".magnify").each(function(){
            $(this).css({height:(thumbSize)});  //ここと＊１、＊２をwidthに変えれば横幅指定になる
        });
 
        var objWidth = $('.magnify').width();
        var objHeight = $('.magnify').height();
 
        $(".magnify").each(function(){
            $(this).wrapAll('<span class="magnify_cover"></span>');
            $(this).parent('.magnify_cover').css({
                margin: '0 10px 10px 0',
                width: (objWidth),
                height: (objHeight),
                float: 'left',
                position: 'relative'
            });
        });
 
        $(".magnify").hover(function(){
            $(this).css({top:'0',left:'0',position: 'absolute',});
            $(this).stop().animate({height:(magnifySize)},500,function(){　　//＊１
                $(this).addClass('shadow');
            });
        }, function(){
            $(this).stop().animate({height:(thumbSize)},300,function(){　　　//＊２
                $(this).css({top:'',left:'',position: 'relative'});
                $(this).removeClass('shadow');
            });
        });
    });
});


// 文字数カウンター
$(function(){
    $("#input-text").on("keyup", function() {
        let countNum = String($(this).val().length);
        $("#counter").text(countNum + "文字");
    });
});


