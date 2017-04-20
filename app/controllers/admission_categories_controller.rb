class AdmissionCategoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /admission_categories
  # GET /admission_categories.json
  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Class"})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admission_categories }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admission_category }
      format.js
    end
  end

  # GET /admission_categories/1
  # GET /admission_categories/1.json
  # nishant test
  def show
    #@admission_category = AdmissionCategory.find(params[:id])
    #load_and_authorize_resource will load the object
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admission_category }
    end
  end

  # GET /admission_categories/1/edit
  def edit
    @admission_category = AdmissionCategory.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @admission_category }
      format.js
    end    
  end

  # POST /admission_categories
  # POST /admission_categories.json
  def create
    #AdmissionCategory.transaction do
      #@admission_category.save
      respond_to do |format|
        #@admission_category_timing = @admission_category.course_timings.new(params[:course_timing])
        if @admission_category.save #@admission_category_timing.save
          format.html { redirect_to admission_categories_path, notice: 'AdmissionCategory was successfully created.' }
          format.json { render json: @admission_category, status: :created, location: @admission_category }
        else
          format.html { render action: "new" }
          format.json { render json: @admission_category.errors, status: :unprocessable_entity }
        end
      end
    #end
    return
  end

  # PUT /admission_categories/1
  # PUT /admission_categories/1.json
  def update
    @admission_category = AdmissionCategory.find(params[:id])

    #AdmissionCategory.transaction do
      #@admission_category.update_attributes(params[:course])
      respond_to do |format|
        if @admission_category.update_attributes(params[:admission_category]) 
          #@admission_category.course_timings.update_attributes(params[:course_timing])
          format.html { redirect_to admission_categories_path, notice: 'AdmissionCategory was successfully updated.' }
          format.json { render json: @admission_category, status: :created, location: @admission_category }
        else
          format.html { render action: "new" }
          format.json { render json: @admission_category.errors, status: :unprocessable_entity }
        end
      end
    #end
    return
  end

  # DELETE /admission_categories/1
  # DELETE /admission_categories/1.json
  def destroy
    @admission_category = AdmissionCategory.find(params[:id])
    @admission_category.destroy

    respond_to do |format|
      format.html { redirect_to admission_categories_path }
      format.json { head :no_content }
    end
  end

end
