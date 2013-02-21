$(document).ready ->
  csrf_token = $("meta[name=csrf-token]").attr("content")
  csrf_param = $("meta[name=csrf-param]").attr("content")
  params = undefined
  params = csrf_param + "=" + encodeURIComponent(csrf_token)  if csrf_param isnt `undefined` and csrf_token isnt `undefined`
  $(".redactor").redactor
    imageUpload: "/redactor_rails/pictures?" + params
    imageGetJson: "/redactor_rails/pictures"
    path: "/assets/redactor-rails"
    minHeight: '350'
    autoresize: false
