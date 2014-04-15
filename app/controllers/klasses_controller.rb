class KlassesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /klasses
  # GET /klasses.json
  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Class"})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @klasses }
    end
  end

  def new
    @klass = Klass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @klass }
    end
  end

  # GET /klasss/1
  # GET /klasss/1.json
  # nishant test
  def show
    #@klass = Klass.find(params[:id])
    #load_and_authorize_resource will load the object
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @klass }
    end
  end

  # GET /klasss/1/edit
  def edit
    @klass = Klass.find(params[:id])
  end

  # POST /klasss
  # POST /klasss.json
  def create
    @klass = Klass.new(params[:klass])

    respond_to do |format|
      if @klass.save
        format.html { redirect_to @klass, notice: 'Class was successfully created.' }
        format.json { render json: @klass, status: :created, location: @klass }
      else
        format.html { render action: "new" }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /klasss/1
  # PUT /klasss/1.json
  def update
    @klass = Klass.find(params[:id])

    respond_to do |format|
      if @klass.update_attributes(params[:klass])
        format.html { redirect_to @klass, notice: 'Class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasss/1
  # DELETE /klasss/1.json
  def destroy
    @klass = Klass.find(params[:id])
    @klass.destroy

    respond_to do |format|
      format.html { redirect_to klasss_url }
      format.json { head :no_content }
    end
  end

end
