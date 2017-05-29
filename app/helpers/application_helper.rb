module ApplicationHelper
  def dropdown_begin name
    '<li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">' + name + ' <span class="caret"></span></a>
      <ul class="dropdown-menu">'
  end

  def dropdown_end
    '</ul>
    </li>'
  end
end
