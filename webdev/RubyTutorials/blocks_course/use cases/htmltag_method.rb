def tag(html_tag)
    print "<#{html_tag}>#{yield}</#{html_tag}>"
end

tag(:h1) { "Breaking News!" }
tag(:h2) { "Holy moly this actually works!" }

tag(:ul) do
    tag(:li) { "It sparkles!"}
    tag(:li) { "It shines!"}
    tag(:li) { "It mesmerizes!"}
  end