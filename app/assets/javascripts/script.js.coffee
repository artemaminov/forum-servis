$ ->
  $('#carousel').carouFredSel {
    auto: {
      timeoutDuration: 8000
    }
    responsive: true,
    swipe: true
  }
  $('#offers-carousel').carouFredSel {
    auto: {
      timeoutDuration: 12000
    }
    responsive: true
    width: "100%"
    align: "center"
    scroll: {
      items: 1
    }
    swipe: true
    items: {
      visible: 1
      height: 400
    }
  }

  $('.up').headroom {
    offset: 300
    tolerance: 0
    classes: {
      top: "fadeOutDown"
      notTop: "fadeInUp"
    }
  }
  $('header').headroom {
    offset: 300
    tolerance: 0
    onTop: () ->
      if $.fancybox.getInstance()
        $(window).scrollTop(600)
      closeHeader()
    onNotTop: () ->
      openHeader()
  }
  $('.our-news').headroom {
    offset: 610
    tolerance : 0
    classes: {
      top: "locked"
    }
  }

  $("[data-fancybox]").fancybox {
    infobar: false
    toolbar: false
    arrows: false
    iframe: {
      attr: {
        scrolling: 'auto'
      }
      preload: true
      css: {
        'width': '100%'
        'max-width': '100%'
        'height': '100%'
        'max-height': '100%'
        'margin': '0'
        'padding-top': '99px'
        'background-color': 'transparent'
      }
    }
    beforeShow: () ->
      closeHeader()
      $('.fancybox-buttons').show()
      $('.fancybox-buttons').click () ->
        $.fancybox.getInstance().close()
    beforeClose: () ->
      openHeader()
      $('.fancybox-buttons').hide()
      $('.fancybox-buttons').unbind('click')
  }

  $('[data-fancybox="news-gallery"]').fancybox {
    toolbar: false
    infobar: false
    margin: [250, 100]
    beforeShow: () ->
      openHeader()
      $('.fancybox-buttons').show()
      $('.fancybox-buttons').click () ->
        $.fancybox.getInstance().close()
    beforeClose: () ->
      closeHeader()
      $('.fancybox-buttons').hide()
      $('.fancybox-buttons').unbind('click')
  }

  $('.sprites-v2.up.animated').click (event)->
    selector = $(this).data('scrollto')
    if selector == '#top'
      margin = -5
    else
      margin = 0
    $('html, body').animate({ scrollTop: $(selector).offset().top + margin }, 'slow')

  $("article .button").click () ->
    totalHeight = 0
    $el = $(this)
    $p  = $el.parent()
    $up = $p.parent()
    $ps = $up.find("p:not('.read-more')")
    $ps.each () ->
      totalHeight += $(this).outerHeight()
    $up
      .css {
        "height": $up.height(),
        "max-height": 9999
      }
      .animate {
        "height": totalHeight
      }
    $p.fadeOut()
    return false

  openHeader = () ->
    $('header').animate({height: '110px'}, 200, 'swing').css('overflow', 'visible')
    $('header .navigation-svg').css({bottom: '305px'})
    $('header .header').animate({top: '66px'}, 200, 'swing')
  closeHeader = () ->
    if $('header').hasClass('headroom--top')
      $('header').animate({height: '235px'}, 200, 'swing').css('overflow', 'visible')
      $('header .navigation-svg').css({bottom: '-39px'})
      $('header .header').animate({top: '108px'}, 200, 'swing')