class RecipeDecorator < Draper::Decorator
  include MarkdownHelper

  delegate_all

  def image_url
    object.photo.url
  end

  def chef_name
    if object.fields[:chef]
      object.chef.name
    else
      'Unknown Chef'
    end
  end

  def tags
    if object.fields[:tags]
      object.tags.map(&:name).join(', ')
    else
      'No tags'
    end
  end

  def decription_html
    parse_markdown(object.description)
  end
end
