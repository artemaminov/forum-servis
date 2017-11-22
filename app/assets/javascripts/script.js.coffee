$ ->
  $('#carousel').carouFredSel
    auto:
      timeoutDuration: 8000
    responsive: true,
    swipe: true

  $('#offers-carousel').carouFredSel
    auto:
      timeoutDuration: 12000
    responsive: true
    width: "100%"
    align: "center"
    scroll:
      items: 1
    swipe: true
    items:
      visible: 1
      height: 400

  $('.up').headroom
    offset: 300
    tolerance: 100
    classes:
      initial: ""
      pinned: ""
      unpinned: ""
      top: "fadeOutDown"
      notTop: "fadeInUp"
  $('header').headroom
    offset: 300
    tolerance: 100
    onTop: () ->
      $('header').animate({ height: '305px' }, 200, 'swing').css('overflow', 'visible')
      $('header .header').animate({ top: '140px' }, 200, 'swing')
    onNotTop: () ->
      $('header').animate({ height: '210px' }, 200, 'swing').css('overflow', 'visible')
      $('header .header').animate({ top: '92px' }, 200, 'swing')

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
      $('.fancybox-buttons').show()
      $('.fancybox-buttons').click () ->
        $.fancybox.getInstance().close()
    beforeClose: () ->
      $('.fancybox-buttons').hide()
      $('.fancybox-buttons').unbind('click')
  }

  $('[data-fancybox="news-gallery"]').fancybox {
    toolbar: false
    infobar: false
    margin: [200, 100]
    beforeShow: () ->
      $('.fancybox-buttons').show()
      $('.fancybox-buttons').click () ->
        $.fancybox.getInstance().close()
    beforeClose: () ->
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
