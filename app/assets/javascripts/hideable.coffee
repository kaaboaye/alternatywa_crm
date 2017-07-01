$(document).ready () ->
  #blocks = $(".hideable")
  headers = $(".hideable > .hideable-header")
  contents = $(".hideable > .hideable-content")

  headers.append " <span class=\"caret\"></span>"

  contents.hide()

  headers.click () ->
    content = $(@).parent().children ".hideable-content"

    content.toggle()
    $(@).trigger "dom-change"
