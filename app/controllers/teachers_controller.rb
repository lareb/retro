class TeachersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :teacher

  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Teachers"})
    respond_to do |format|
      format.html
      format.json { render json: @teachers }
    end
  end

end
