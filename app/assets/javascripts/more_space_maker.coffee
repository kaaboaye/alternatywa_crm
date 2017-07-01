more_space_maker = () ->
  body = $ "body"
  scroll = $(window).scrollTop()

  body.height("auto") # restore default height
  body.height(body.height() + screen.availHeight * 0.7) # set new height
  $(window).scrollTop(scroll) # restore previous scroll

# events listeners
$(document).ready more_space_maker
$(window).resize more_space_maker
$(document).on "dom-change", more_space_maker
