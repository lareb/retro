class AdmissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /admissions
  # GET /admissions.json
  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Admission"})
    #@admissions = Admission.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admissions }
    end
  end

  # GET /admissions/1
  # GET /admissions/1.json
  def show
    @completed = params[:step] == "2" ? true : false
    @admission = Admission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admission }
    end
  end

  # GET /admissions/new
  # GET /admissions/new.json
  def new
    @admission = Admission.new
    @admission_no = Admission.count

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admission }
    end
  end

  # GET /admissions/1/edit
  def edit
    @admission = Admission.find(params[:id])
  end

  # POST /admissions
  # POST /admissions.json
  def create
    @admission = Admission.new(params[:admission])

    respond_to do |format|
      if @admission.save
        format.html { redirect_to edit_admission_path(@admission, :step => 2), notice: 'Admission was successfully created.' }
        format.json { render json: @admission, status: :created, location: @admission }
      else
        format.html { render action: "new" }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admissions/1
  # PUT /admissions/1.json
  def update
    @admission = Admission.find(params[:id])
    next_step = params[:step] == "2" ? @admission : edit_admission_path(@admission, :step => 2)
    respond_to do |format|
      if @admission.update_attributes(params[:admission])
        format.html { redirect_to next_step, notice: 'Admission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admissions/1
  # DELETE /admissions/1.json
  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy

    respond_to do |format|
      format.html { redirect_to admissions_url }
      format.json { head :no_content }
    end
  end

  def review
    sort_fields = [:order_number]
    q, per, page, sort, sort_direction = datatable_params(params[:sSearch],
                                                               params[:iDisplayLength],
                                                               params[:iDisplayStart],
                                                               params[:iSortingCols],
                                                               params[:iSortCol_0],
                                                               params[:sSortDir_0],
                                                               sort_fields)

    search_conditions = "admissions.student_first_name like '%#{q}%' OR
                        admissions.student_middle_name like '%#{q}%' OR
                        admissions.student_last_name like '%#{q}%' OR
                        admissions.admission_no like '%#{q}%' OR
                        admissions.father_name like '%#{q}%' OR
                        admissions.mother_name like '%#{q}%' OR
                        admissions.local_guardian_name like '%#{q}%' OR
                        admissions.student_category like '%#{q}%' OR
                        admissions.city like '%#{q}%' OR
                        admissions.address_line1 like '%#{q}%' OR
                        admissions.address_line2 like '%#{q}%'"
    @admissions = Admission.page(page).per(per).where(search_conditions)
    @total = Admission.where(search_conditions).count.ceil

    respond_to do |format|
      format.html
      format.json
    end
  end

end
