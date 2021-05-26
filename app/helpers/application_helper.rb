module ApplicationHelper
  include Turbo::StreamsHelper
  include Turbo::FramesHelper
  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "h-6 w-6 text-gray-800")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end
  
  def disable_with(text)
    "<i class=\"far fa-spinner-third fa-spin\"></i> #{text}".html_safe
  end

  def pages_without_navbar
    return true unless current_page?("/choose-universe")  || current_page?("/contributor-tutorial") || current_page?("/entrepreneur-tutorial")
  end

  def nav_current
    "bg-gray-900 text-white"
  end
end