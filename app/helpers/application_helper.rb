module ApplicationHelper
  def dropdown_begin name
    raw '<li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false">
        ' + name + ' <span class="caret"></span></a>
      <ul class="dropdown-menu">'
  end

  def dropdown_end
    raw '</ul></li>'
  end

  def hideable title, content
    raw "<div class=\"hideable\">
      <h3 class=\"hideable-header\">#{ title }</h3>
      <div class=\"hideable-content\">
        #{ content }
      </div>
    </div>"
  end
end
