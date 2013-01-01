class KlassesController < ApplicationController
  before_filter :authenticate_user!

  # GET /klasses
  # GET /klasses.json
  def index
    @klasses = Klass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @klasses }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @klass = Klass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @klass }
    end
  end
end
