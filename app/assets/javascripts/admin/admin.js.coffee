jQuery ->
  # Find all YouTube videos
  $allVideos = $("iframe[src^='http://www.youtube.com']")

  # The element that is fluid width
  $fluidEl = $(".film")

  # Figure out and save aspect ratio for each video
  $allVideos.each ->

    # and remove the hard coded width/height
    $(this).data("aspectRatio", @height / @width).removeAttr("height").removeAttr "width"


  # When the window is resized
  # (You'll probably want to debounce this)

  # Resize all videos according to their own aspect ratio

  # Kick off one resize to fix all videos on page load
  $(window).resize(->
    newWidth = $fluidEl.width()
    $allVideos.each ->
      $el = $(this)
      $el.width(newWidth).height newWidth * $el.data("aspectRatio")

  ).resize()

  $('#sliders').sortable(
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  )

  $(".sortable").sortable(
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
