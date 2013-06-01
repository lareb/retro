class CoursesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Class"})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  # nishant test
  def show
    #@course = Course.find(params[:id])
    #load_and_authorize_resource will load the object
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    #@course = @parent.msri_registrations.build
  end

  # POST /courses
  # POST /courses.json
  def create
    Course.transaction do
      @course.save
      respond_to do |format|
        @course_timing = @course.course_timings.new(params[:course_timing])
        if @course_timing.save
          format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
          format.json { render json: @course, status: :created, location: @course }
        else
          format.html { render action: "new" }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
    return
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    Course.transaction do
      @course.update_attributes(params[:course])
      respond_to do |format|
        if @course.course_timings.update_attributes(params[:course_timing])
          format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
          format.json { render json: @course, status: :created, location: @course }
        else
          format.html { render action: "new" }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
    return
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

end
