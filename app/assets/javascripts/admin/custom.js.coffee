$(document).ready ->

  $('.chzn-select').chosen
    allow_single_deselect: true
    no_results_text: '沒有符合的選項'

  $(".alert-message a.close").live "click", ->
    $(this).parent().parent(".c-alert").slideUp "slow"

  $(".bottom_tooltip").tooltip placement: "bottom"
  $(".left_tooltip").tooltip placement: "left"
  $(".right_tooltip").tooltip placement: "right"
  $(".top_tooltip").tooltip()
  $(".dropdown-menu.dropdown-user-account").click (event) ->
    event.stopPropagation()

  $(".accordion-body.collapse.in").prev(".accordion-heading").addClass "acc-active"
  $(".accordion-heading").live "click", ->
    $(".accordion-heading").removeClass "acc-active"
    $(this).addClass "acc-active"

  $(".fancy").uniform
    fileButtonText: "選擇檔案"
    fileDefaultText: ""
