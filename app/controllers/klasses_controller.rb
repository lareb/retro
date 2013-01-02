class KlassesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /klasses
  # GET /klasses.json
  def index
    #@klasses = Klass.all
    #load_and_authorize_resource will load the object
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @klasses }
    end
  end

  # GET /students/1
  # GET /students/1.json
  # nishant test
  def show
    #@klass = Klass.find(params[:id])
    #load_and_authorize_resource will load the object
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @klass }
    end
  end
end
