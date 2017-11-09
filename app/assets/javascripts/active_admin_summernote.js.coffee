$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote(
      lang: 'ru-RU'
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['para', ['ul', 'ol']],
        ['insert', ['picture', 'link', 'video']],
        ['misc', ['fullscreen', 'codeview', 'undo', 'redo']]
      ]
      callbacks:
        onImageUpload: (files) ->
          img = sendFile(this, files[0])
        onMediaDelete: (target, editor, editable) ->
          image_id = target[0].id
          if !!image_id
            deleteFile image_id
          target.remove()
    )

  sendFile = (that, file) ->
    data = new FormData
    data.append 'Content-Type', file.type
    data.append 'attachment[filename]', file
    data.append 'attachment[attachable_type]', 'News'
    $.ajax
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
        img = document.createElement('IMG')
        img.src = data.filename.url
        img.setAttribute('id', data.id)
        $(that).summernote 'insertNode', img

  deleteFile = (file_id) ->
    $.ajax
      dataType: 'json'
      type: 'DELETE'
      url: "/admin/attachments/#{file_id}"
      cache: false
      contentType: false
      processData: false