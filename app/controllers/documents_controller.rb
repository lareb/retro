class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    #@render_breadcrumb = breadcrumb_path({:disable => "Teachers"})
    respond_to do |format|
      format.html
      format.json { render json: @documents }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    #@teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @document }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @document }
    end
  end

  def edit
    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @document }
    end
  end

  def create
    #@teacher = Teacher.new(params[:teacher])
    puts "=========================="
    ap @document
    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'Doccument was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to documents_path, notice: 'Doccument was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_path }
      format.json { head :no_content }
    end
  end

end
