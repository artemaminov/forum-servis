$ ->
  $('#carousel').carouFredSel
    auto:
      timeoutDuration: 8000
    responsive: true,
    swipe: true

  $('#offers-carousel').carouFredSel
    auto:
      timeoutDuration: 12000
    responsive: true,
    width: "100%",
    align: "center",
    scroll:
      items: 1
    swipe: true,
    items:
      visible: 1,
      height: 400

  $('.up').headroom
    offset: 300,
    tolerance: 100,
    classes:
      initial: "",
      pinned: "",
      unpinned: "",
      top: "fadeOutDown",
      notTop: "fadeInUp"

  $("[data-fancybox]").fancybox
    loop: false,
    infobar: false,
    buttons: true,
    slideShow: false,
    fullScreen: false,
    thumbs: false,
    closeBtn: true,
    iframe:
      scrolling: 'auto',
      preload: true,
      css:
        'width': '100%',
        'height': '100%',
        'margin': '0',
        'padding-top': '300px',
        'background-color': 'transparent'
#    onComplete: () ->
#      $('.carousel').toggleClass('on-top-of-hack')
#      $('header, .header').toggleClass('on-top-of-fancybox')
#    beforeClose: () ->
#      $('header, .header').toggleClass('on-top-of-fancybox')
#      $('.carousel').toggleClass('on-top-of-hack')

  $('.sprites-v2.up.animated').click (event)->
    selector = $(this).data('scrollto')
    if selector == '#top'
      margin = 20
    else
      margin = 0
    $('html, body').animate({ scrollTop: $(selector).offset().top + margin }, 'slow')

#  $.ajax
#    url: "some.html"
#    dataType: "html"
#    error: (jqXHR, textStatus, errorThrown) ->
#      $('body').append "AJAX Error: #{textStatus}"
#    success: (data, textStatus, jqXHR) ->
#      $('body').append "Successful AJAX call: #{data}"

#  $("a[data-fancy]").ajaxError (event, data, settings, thrownError) ->
#    console.log(thrownError)
#
#  $("a[data-fancy]").ajaxSuccess (event, data, settings) ->
#    e.preventDefault()
#    $('.fancybox-slide--ajax').html(data)
#    alert data
#    switch data.type
#      when "root"
#        alert "root"
#      when "subcategory"
#        alert "subcategory"
#      when "list"
#        alert "list"
