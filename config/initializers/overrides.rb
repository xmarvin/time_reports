ActionView::Base.field_error_proc = Proc.new { |html_tag, instance|
  unless /^<label/.match(html_tag)
    html_tag = "<span class=\"fieldWithErrors\">#{html_tag} </span>"
  end
  html_tag.html_safe
}
