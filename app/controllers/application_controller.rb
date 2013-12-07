class ApplicationController < ActionController::Base
  USER, PASSWORD = 'amazing', 'rooftroop'
  protect_from_forgery
  layout "application"
  before_filter :authentication_check

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

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

  protected
  def datatable_params(sSearch, iDisplayLength,  iDisplayStart, iSortingCols, iSortCol_0, sSortDir_0, sort_fields)

    per = iDisplayLength.nil? ? 10 : iDisplayLength
    page = iDisplayStart.nil? ? nil : (iDisplayStart.to_i/iDisplayLength.to_i)+1

    #Sorting
    if iSortingCols && iSortingCols != "0"
      sort = sort_fields[iSortCol_0.to_i]
    else
      sort = nil
    end

    sort_direction = sSortDir_0.present? ? sSortDir_0.to_sym : nil

    Rails.logger.debug("\n\nsSearch: #{sSearch}, per_page: #{per}, page: #{page}, sort: #{sort}, sort_direction: #{sort_direction}\n\n")
    return sSearch, per, page, sort, sort_direction
  end
  
private
    def authentication_check
      authenticate_or_request_with_http_basic do |user, password|
        user == USER && password == PASSWORD
      end
    end
end
