// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - -   Pagination JS - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

$(document).on('ready page:load', function () {
  if ($('.pagination').length) {
    $(window).scroll(function() {
        var html = [
            '<div class="main-container panel-wrapper">',
            '   <div class="post-container panel-container">',
            '           <a class="overlay" href="/submit"> ',
            '               <div class="fader"></div>',
            '               <span class="panel-information">',
            '                   <h5 class="panel-description">Seen something worth sharing?</h5>',
            '                   <h4 class="panel-description-two">Contribute it to the Archive!</h4>',
            '               </span>',
            '           </a>',
            '           <div class="link-container">',
            '           </div>  ',
            '   </div>',
            '</div>'
        ].join('');
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
        $('.pagination').text("");  

        return $.getScript(url) && $('.main-container:last').after(html);

      };
    });
    return $(window).scroll();
  };
});

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - -  Side Bar JS - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

$(document).on('ready page:load', function () {

    // show sidebar and dimmer
    function showSidebar() {
        sidebar.css('margin-right', '200px');

        dimmer.show(0, function() {
            dimmer.fadeTo('200', 0.6);
        });   
    }

    // hide sidebar and dimmer
    function hideSidebar() {
        sidebar.css('margin-right', sidebar.width() * -1 + 'px');

        dimmer.fadeTo('200', 0, function() {
            dimmer.hide();
        });;
    }

    // selectors
    var sidebar = $('[data-sidebar]');
    var button = $('[data-sidebar-button]');
    var dimmer = $('[data-sidebar-dimmer]');

    // add height to content area
    dimmer.parent().css('min-height', 'inherit');

    // hide sidebar on load
    sidebar.css('margin-right ', sidebar.width() * -1 + 'px');

    sidebar.show(0, function() {
        sidebar.css('transition', 'all 0.5s ease');
    });

    // toggle sidebar on click
    button.click(function() {
        if (dimmer.is(':visible')) {
            hideSidebar();
        } else {
            showSidebar();
        }
        return false;
    });

    // hide sidebar on dimmer click
    dimmer.click(function() {
        hideSidebar();
    });


 // Stop page scrolling when side bar is up

    $.fn.scrollGuard = function() {
        return this
            .on( 'mousewheel', function ( e ) {
                var event = e.originalEvent;
                var d = event.wheelDelta || -event.detail;
                this.scrollTop += ( d < 0 ? 1 : -1 ) * 30;
                e.preventDefault();
            });
    };    

    $(function(){
        $( '.area' ).scrollGuard();
    });
});

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - Ovelay JS - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

  function play(object){
    $(object.querySelector('.overlay')).hide(200);
    object.querySelector('iframe').src =
    object.querySelector('iframe').src.replace('autoplay=0','&autoplay=1');
    return false;
  }

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - Scrolling JS - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

$(document).on('ready page:load', function () {
      $(".scroll-to-content").click(function() {
        $('html,body').animate({
            scrollTop: $(".main-container").offset().top},
            1000,'easeOutQuart')
        });
});


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - -  Popup JS - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

$(document).on('ready page:load', function () {
    $(".tag-wrap").click(function(e) {
        $(".category-tags").toggle();
        e.stopPropagation();
    });

    $(document).click(function(e) {
        if (!$(e.target).is('.category-tags, .category-tags*')) {
            $(".category-tags").hide();
        }
    });
});


$(document).on('ready page:load', function () {
    $(".login-section").click(function(e) {
        $(".user-popup").toggle();
        e.stopPropagation();
    });

    $(document).click(function(e) {
        if (!$(e.target).is('.user-popup, .user-popup*')) {
            $(".user-popup").hide();
        }
    });
});


$(document).on('page:load ready', function () {
    $('body').on('click','.share-wrapper',function(e){
     $(this).find(".share").toggle();
     e.stopPropagation();
    });
});



/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - -  Cover  - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

//jQuery is required to run this code
$(document).on('ready page:load', function () {

    scaleVideoContainer();

    initBannerVideoSize('.video-container .poster img');
    initBannerVideoSize('.video-container .filter');
    initBannerVideoSize('.video-container video');

    $(window).on('resize', function() {
        scaleVideoContainer();
        scaleBannerVideoSize('.video-container .poster img');
        scaleBannerVideoSize('.video-container .filter');
        scaleBannerVideoSize('.video-container video');
    });

});

function scaleVideoContainer() {

    var height = $(window).height() + 5;
    var unitHeight = parseInt(height) + 'px';
    $('.homepage-hero-module').css('height',unitHeight);

}

function initBannerVideoSize(element){

    $(element).each(function(){
        $(this).data('height', $(this).height());
        $(this).data('width', $(this).width());
    });

    scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

    var windowWidth = $(window).width(),
    windowHeight = $(window).height() + 5,
    videoWidth,
    videoHeight;

    console.log(windowHeight);

    $(element).each(function(){
        var videoAspectRatio = $(this).data('height')/$(this).data('width');

        $(this).width(windowWidth);

        if(windowWidth < 1000){
            videoHeight = windowHeight;
            videoWidth = videoHeight / videoAspectRatio;
            $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});

            $(this).width(videoWidth).height(videoHeight);
        }

        $('.homepage-hero-module .video-container video').addClass('fadeIn animated');

    });
}
