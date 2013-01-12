class TeacherSubjectsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :teacher
  load_and_authorize_resource :teacher_subject, :through => :teacher

  # GET /teacher_subjects
  # GET /teacher_subjects.json
  def index
    @render_breadcrumb = breadcrumb_path({@teacher.name => url_for(@teacher),:disable => "Subjects"})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teacher_subjects }
    end
  end

  # GET /teacher_subjects/1
  # GET /teacher_subjects/1.json
  def show
    #@teacher_subject = TeacherSubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher_subject }
    end
  end

  # GET /teacher_subjects/new
  # GET /teacher_subjects/new.json
  def new
    #@teacher_subject = TeacherSubject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher_subject }
    end
  end

  # GET /teacher_subjects/1/edit
  def edit
    #@teacher_subject = TeacherSubject.find(params[:id])
  end

  # POST /teacher_subjects
  # POST /teacher_subjects.json
  def create
    #@teacher_subject = TeacherSubject.new(params[:teacher_subject])

    respond_to do |format|
      if @teacher_subject.save
        format.html { redirect_to teachers_path, notice: 'Teacher subject was successfully created.' }
        format.json { render json: @teacher_subject, status: :created, location: @teacher_subject }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_subjects/1
  # PUT /teacher_subjects/1.json
  def update
    #@teacher_subject = TeacherSubject.find(params[:id])

    respond_to do |format|
      if @teacher_subject.update_attributes(params[:teacher_subject])
        format.html { redirect_to @teacher_subject, notice: 'Teacher subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_subjects/1
  # DELETE /teacher_subjects/1.json
  def destroy
    #@teacher_subject = TeacherSubject.find(params[:id])
    #@teacher_subject.destroy

    respond_to do |format|
      format.html { redirect_to teacher_subjects_url }
      format.json { head :no_content }
    end
  end
end
