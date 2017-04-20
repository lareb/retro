class TeacherKlassesController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :klass
  load_and_authorize_resource :teacher_klass, :through => :klass

  def index
    @render_breadcrumb = breadcrumb_path({@klass.name => url_for(@klass),:disable => "Subjects"})
    if request.xhr?
      render :partial => "index"
    else
      respond_to do |format|
        format.html
        format.json { render json: @teacher_klasses }
      end
    end

  end

  def show
    
  end

  def new
    @render_breadcrumb = breadcrumb_path({@klass.name => url_for(@klass),:disable => "Subjects"})
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @teacher_klass }
    end
  end

  def create
    respond_to do |format|
      if @teacher_klass.save
        format.html { redirect_to klasses_path, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher_klass, status: :created, location: @teacher_klass }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_klass.errors, status: :unprocessable_entity }
      end
    end
  end

end
