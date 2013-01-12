class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "application"

  def breadcrumb_path(path)
    root_path = {:home => "/"}
    path = {} if path.nil?
    path = root_path.merge!(path)
    links = []
    index = 0
    root_path.each do |title, link|
        if(index == root_path.length - 1)
          links << link.to_s.humanize
        else
          links << "<a href='#{link}' title='#{title}'>#{title.to_s.underscore.humanize}</a>"
        end

        index = index + 1
    end

    return links.join("&nbsp;&#187;&nbsp;")
  end

end
