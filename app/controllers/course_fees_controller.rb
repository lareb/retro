class CourseFeesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :course
  load_and_authorize_resource :course_fee, :through => :course

  # GET /course_fees
  # GET /course_fees.json
  def index
    #@course_fees = CourseFee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_fees }
    end
  end

  # GET /course_fees/1
  # GET /course_fees/1.json
  def show
    #@course_fee = CourseFee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_fee }
    end
  end

  # GET /course_fees/new
  # GET /course_fees/new.json
  def new
    #@course_fee = CourseFee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_fee }
    end
  end

  # GET /course_fees/1/edit
  def edit
    #@course_fee = CourseFee.find(params[:id])
  end

  # POST /course_fees
  # POST /course_fees.json
  def create
    #@course_fee = CourseFee.new(params[:course_fee])

    respond_to do |format|
      if @course_fee.save
        format.html { redirect_to course_course_fees_path(@course), notice: 'Course fee was successfully created.' }
        format.json { render json: @course_fee, status: :created, location: @course_fee }
      else
        format.html { render action: "new" }
        format.json { render json: @course_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_fees/1
  # PUT /course_fees/1.json
  def update
    #@course_fee = CourseFee.find(params[:id])

    respond_to do |format|
      if @course_fee.update_attributes(params[:course_fee])
        format.html { redirect_to course_course_fees_path(@course), notice: 'Course fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_fees/1
  # DELETE /course_fees/1.json
  def destroy
    #@course_fee = CourseFee.find(params[:id])
    #@course_fee.destroy

    respond_to do |format|
      format.html { redirect_to course_course_fees_path(@course) }
      format.json { head :no_content }
    end
  end
end
