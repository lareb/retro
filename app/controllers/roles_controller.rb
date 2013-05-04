class RolesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Roles"})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end
  
end
