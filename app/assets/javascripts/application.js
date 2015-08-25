
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



$(document).ready(function() {
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


$(document).on('ready page:load', function () {

    // show sidebar and dimmer
    function showSidebar() {
        sidebar.css('margin-right', '200px');

        dimmer.show(0, function() {
            dimmer.fadeTo('200', 0.4);
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
});


