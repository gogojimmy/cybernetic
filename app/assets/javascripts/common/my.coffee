jQuery ->
  $(".carousel").carousel()

  $("#product-tab > li:first").addClass "active"
  $(".tab-content > .tab-pane:first").addClass "active"

  $("#main-nav ul.dropdown-menu").hover ->
    $(this).prev().addClass "hovered"

  $("#main-nav ul.dropdown-menu").mouseleave ->
    $(this).prev().removeClass "hovered"

  if(typeof gon != 'undefined')
    $("#categories-menu a#category-" + gon.active_id).parent("li").addClass "active"
    $("#categories-menu a#category-" + gon.active_id).parent("li").parents(".collapse").collapse "show"

  $("#news-index").ticker()

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

  $("#product .product_image img").click ->
    $("#product-main-image img").attr('src', ($(this).data("url")))
