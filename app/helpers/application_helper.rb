module ApplicationHelper
  
  def sitemap(text)
    "<h2>#{link_to('Examples', examples_path)} > #{text}</h2>".html_safe
  end
  
  def see_more(link)
    "<h4>#{link_to("See More at Foursquare Documentation", link)}</h4>".html_safe
  end

  def errors_helper(model)
    if model.errors.any?
      content_tag(:div, :id => "error_explanation") do
        content_tag(:h2, pluralize(@contact.errors.count, "error") + " prohibited this contact from being saved:")
        content_tag(:ul) do
          @contact.errors.full_messages.each { |msg| content_tag(:li, msg) }
        end
      end
    end
  end

  def flash_banner
    flash.collect do |name, msg|
      unless msg.blank?
        content_tag(:div, :class => "alert #{flash_class(name)}") do
          content_tag(:a, :class => "alert-link close", :"data-dismiss"=>"alert") do
            content_tag(:i, "", :class => "icon-remove")
          end.html_safe + msg
        end
      end
    end.join("").html_safe
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

end