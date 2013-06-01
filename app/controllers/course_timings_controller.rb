class CourseTimingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :course_timing
  load_resource :course

  # GET /course_timings
  # GET /course_timings.json
  def index
    @course_timings = CourseTiming.where(:course_id => params[:course_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_timings }
    end
  end

  # GET /course_timings/1
  # GET /course_timings/1.json
  def show
    @course_timing = CourseTiming.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_timing }
    end
  end

  # GET /course_timings/new
  # GET /course_timings/new.json
  def new
    @course_timing = CourseTiming.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_timing }
    end
  end

  # GET /course_timings/1/edit
  def edit
    @course_timing = CourseTiming.find(params[:id])
  end

  # POST /course_timings
  # POST /course_timings.json
  def create
    #@course_timing = @course.course_timings.build(params[:course_timings])

    @course_timing = @course.course_timings.new(params[:course_timing])

    respond_to do |format|
      if @course_timing.save
        format.html { redirect_to courses_path, notice: 'CourseTiming was successfully created.' }
        format.json { render json: @course_timing, status: :created, location: @course_timing }
      else
        format.html { render action: "new" }
        format.json { render json: @course_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_timings/1
  # PUT /course_timings/1.json
  def update
    @course_timing = CourseTiming.find(params[:id])

    respond_to do |format|
      if @course_timing.update_attributes(params[:course_timing])
        format.html { redirect_to @course_timing, notice: 'CourseTiming was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_timing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_timings/1
  # DELETE /course_timings/1.json
  def destroy
    @course_timing = CourseTiming.find(params[:id])
    @course_timing.destroy

    respond_to do |format|
      format.html { redirect_to course_timings_url }
      format.json { head :no_content }
    end
  end

end
