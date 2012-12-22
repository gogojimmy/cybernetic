jQuery ->
  $(".carousel").carousel()

  $("#product-tab > li:first").addClass "active"
  $(".tab-content > .tab-pane:first").addClass "active"

  $("#main-nav ul.dropdown-menu").hover ->
    $(this).prev().addClass "hovered"

  $("#main-nav ul.dropdown-menu").mouseleave ->
    $(this).prev().removeClass "hovered"
