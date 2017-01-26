(function() {
    var active = false;
    var menuIcon = $('.menu-icon');
    var body = $('body');

    var toggleMenu = function() {
      if (!active) {
          active = true;
          openMenu();
      } else {
          active = false;
          closeMenu();
      }
  };

    var click = 'click';
    if( 'ontouchstart' in window ){
        click = 'touchstart';
    }

    menuIcon.on(click, toggleMenu);

    function openMenu(){
        //Show Menu
        menuIcon.addClass("is-active");
        $('div.menu-bg').addClass('animate');
        $('.menu-splitL').addClass('animate');
        $('.menu-splitR').addClass('animate');
        $('.menu li').addClass('animate');
        body.addClass("noscroll");
    }

    function closeMenu(){

        //Hide Menu

        menuIcon.removeClass("is-active");
        $('.menu li').removeClass('animate');
        $('.menu-splitL').removeClass('animate');
        $('.menu-splitR').removeClass('animate');
        setTimeout(function(){
            $('div.menu-bg').removeClass('animate');
        }, 100);
        body.removeClass("noscroll");

    }
}());
