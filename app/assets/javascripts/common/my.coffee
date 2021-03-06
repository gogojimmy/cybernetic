jQuery ->
  $(".carousel").carousel()

  $("#product-tab > .navbar-inner > ul.nav > li:first").addClass "active"
  $(".tab-content > .tab-pane:first").addClass "active"

  $("#main-nav ul.dropdown-menu").hover ->
    $(this).prev().addClass "hovered"

  $("#main-nav ul.dropdown-menu").mouseleave ->
    $(this).prev().removeClass "hovered"

  if(typeof gon != 'undefined')
    $("#categories-menu a#category-" + gon.active_id).parent("li").addClass "active"
    $("#categories-menu a#category-" + gon.active_id).parent("li").parents(".collapse").collapse "show"
    if gon.locale == 'not_zh_tw'
      $("#mega-menu").css("width", "860px")
      $("header .form").addClass("en-form")
    else
      $("header .form").removeClass("en-form")


  if $("#news-index").length >= 1
    $("#news-index").ticker(titleText: gon.newsTitle)

  # Find all YouTube videos
  #$allVideos = $("iframe[src^='http://www.youtube.com']")

  ## The element that is fluid width
  #$fluidEl = $("#film")

  ## Figure out and save aspect ratio for each video
  #$allVideos.each ->

    ## and remove the hard coded width/height
    #$(this).data("aspectRatio", @height / @width).removeAttr("height").removeAttr "width"


  # When the window is resized
  # (You'll probably want to debounce this)

  # Resize all videos according to their own aspect ratio

  # Kick off one resize to fix all videos on page load
  #$(window).resize(->
    #newWidth = $fluidEl.width()
    #$allVideos.each ->
      #$el = $(this)
      #$el.width(newWidth).height newWidth * $el.data("aspectRatio")

  #).resize()

  $("#product .product_image img").click ->
    $("#product-main-image img").attr('src', ($(this).data("url")))
    $("#modal-download-image img").attr('src', ($(this).data("url")))
    $("#modal-download-image a").attr('href', ($(this).data("large-url")))

  $(".product-images").each ->
    count = $(this).find("li").length
    if count == 1
      $(this).css("background-image", "url('/assets/dotted-02.png')")

  $(".posts .entry table").addClass("table table-striped table-bordered")

  slider = $("#slider").carousel(interval: 5000).bind("slid", ->
    index = $(this).find(".active").index()
    $(this).find("a").removeClass("pager-active").eq(index).addClass "pager-active"
  )
  $("#slider .slider-pager a").click (e) ->
    index = $(this).index()
    $("#slider").carousel index
    e.preventDefault()

  $(".film").hover (->
    $(this).find(".overlay").show()
    $(this).find(".overlay").next().css opacity: 0.1
  ), ->
    $(this).find(".overlay").hide()
    $(this).find(".overlay").next().css opacity: 1

