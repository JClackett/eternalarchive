
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
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
        $('.pagination').text("");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
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

// $(document).on('ready page:load', function () {
//   $(".category-links").click(function() {
//     $('html,body').animate({
//         scrollTop: $(".main-container").offset().top},1000,'easeOutQuart')
//     });
// });

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
 

$(document).on('ready page:load', function () {
    $(".share-wrapper").click(function(e) {
        $(this).find(".share").toggle();
        e.stopPropagation();
    });

    $(".share-wrapper").click(function(e) {
        $(this).toggleClass( "share-selected" )
        e.stopPropagation();
    });
    
    $(document).click(function(e) {
        if (!$(e.target).is('.share, .share*')) {
            $(".share").hide();
        }
    });
});


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - -  Scale Text  - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */


// function setScale(object){

//     var $maincontainer = $('.overlay'); //Cache this for performance

//     var scaleFactor = 0.2,
//         scaleSource = $maincontainer.width(),

//     fontSize = scaleSource * scaleFactor; //Multiply the width of the body by the scaling factor:


//     $('h5').css('font-size', fontSize + '%');
//     return false;
// };



