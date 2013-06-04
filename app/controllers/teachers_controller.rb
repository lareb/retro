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

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @teacher }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @user = User.new
    @teacher = Teacher.new
    respond_to do |format|
      format.html
      format.json { render json: @teacher }
    end
  end

  def edit
    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @teacher }
    end
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def klasses
    @render_breadcrumb = breadcrumb_path({:disable => "Teachers"})
    @klasses = @teacher.klasses
    respond_to do |format|
      format.html {render :template => "/klasses/index"}
      format.json { render json: @teachers }
    end
  end

end
