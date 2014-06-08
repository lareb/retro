class TeacherSectionsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :klass
  load_and_authorize_resource :section, :through => :klass
  load_and_authorize_resource :teacher_section, :through => :section

  def index
    @render_breadcrumb = breadcrumb_path({@klass.name => url_for(@klass),:disable => "Subjects"})

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @teacher_sections }
    end
  end

  def show
    
  end

  def new
    @render_breadcrumb = breadcrumb_path({@klass.name => url_for(@klass),:disable => "Subjects"})
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @teacher_section }
    end
  end

  def create
    respond_to do |format|
      if @teacher_section.save
        format.html { redirect_to klasses_path, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher_section, status: :created, location: @teacher_section }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_section.errors, status: :unprocessable_entity }
      end
    end
  end

end
