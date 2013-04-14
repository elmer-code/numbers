module CollectionsHelper
  def nested_collections(collections)
    collections.map do |collection, child_collections|
      render(collection) + content_tag(:div, nested_collections(child_collections), class: "nested_collections")
    end.join.html_safe
  end
end
