$ ->
  resize = (context, x, style) ->
    $editable = context.layoutInfo.editable
    $img = $($editable.data('target'))
    $img.parent().removeClass()
    $img.parent().addClass(style)
    context.invoke('editor.resizeTo', { x: x, y: '' }, $img)
    context.invoke('imagePopover.hide')
    context.invoke('handle.hide')
  ResetImageSizeButton = (context) ->
    ui = $.summernote.ui
    button = ui.button({
      contents: '<i class="fa fa-child"/> Оригинальный размер',
      tooltip: 'Вернуть оригинальный размер',
      click: () ->
        resize context, 'auto', 'one-in-a-row'
    }).render()
  OneInARowButton = (context) ->
    ui = $.summernote.ui
    button = ui.button({
      contents: '<i class="fa fa-child"/> 1/1',
      tooltip: 'Изображение во всю ширину',
      click: () ->
        resize context, '646px', 'one-in-a-row'
    }).render()
  TwoInARowButton = (context) ->
    ui = $.summernote.ui
    button = ui.button({
      contents: '<i class="fa fa-child"/> 1/2',
      tooltip: 'Изображение в половину ширины',
      click: () ->
        resize context, '320px', 'two-in-a-row'
    }).render()
  FourInARowButton = (context) ->
    ui = $.summernote.ui
    button = ui.button({
      contents: '<i class="fa fa-child"/> 1/4',
      tooltip: 'Изображение в 1/4 ширины',
      click: () ->
        resize context, '157px', 'four-in-a-row'
    }).render()

  $('[data-provider="summernote"]').each ->
    $(this).summernote({
      width: 740
      lang: 'ru-RU'
      shortcuts: false
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['para', ['ul', 'ol']],
        ['insert', ['picture', 'link', 'video']],
        ['misc', ['fullscreen', 'codeview', 'undo', 'redo']]
      ]
      popover: {
        image: [
          ['size', ['resetimagesize', 'oneinarow', 'twoinarow', 'fourinarow']]
          ['remove', ['removeMedia']]
        ]
      }
      callbacks: {
        onImageUpload: (files) ->
          img = sendFile(this, files[0])
        onMediaDelete: (target, editor, editable) ->
          image_id = target[0].id
          if !!image_id
            deleteFile image_id
            $("""a[data-image-id="#{image_id}"]""").remove()
      }
      buttons: {
        resetimagesize: ResetImageSizeButton
        oneinarow: OneInARowButton
        twoinarow: TwoInARowButton
        fourinarow: FourInARowButton
      }
    })

  sendFile = (that, file) ->
    data = new FormData
    data.append 'Content-Type', file.type
    data.append 'attachment[filename]', file
    data.append 'attachment[attachable_type]', 'News'
    $.ajax {
      data: data
      dataType: 'json'
      type: 'POST'
      url: '/admin/attachments'
      cache: false
      contentType: false
      processData: false
      beforeSend: (xhr, opts) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
      success: (data) ->
        aImg = document.createElement 'a'
        aImg.setAttribute 'href', data.filename.url
        aImg.dataset.imageId = data.id
        aImg.dataset.fancybox = 'news-gallery'
        img = document.createElement 'img'
        img.src = data.filename.news.url
        img.setAttribute 'id', data.id
        aImg.appendChild img
        $(that).summernote 'insertNode', aImg
    }

  deleteFile = (file_id) ->
    $.ajax {
      dataType: 'json'
      type: 'DELETE'
      url: "/admin/attachments/#{file_id}"
      cache: false
      contentType: false
      processData: false
    }