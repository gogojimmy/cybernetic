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
