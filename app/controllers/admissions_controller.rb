class AdmissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /admissions
  # GET /admissions.json
  def index
    @render_breadcrumb = breadcrumb_path({:disable => "Admission"})
    #@admissions = Admission.all
    
    
    sort_fields = [:order_number]
    q, per, page, sort, sort_direction = datatable_params(params[:sSearch],
                                                               params[:iDisplayLength],
                                                               params[:iDisplayStart],
                                                               params[:iSortingCols],
                                                               params[:iSortCol_0],
                                                               params[:sSortDir_0],
                                                               sort_fields)

    search_conditions = "(admissions.student_first_name like '%#{q}%' OR
                        admissions.student_middle_name like '%#{q}%' OR
                        admissions.student_last_name like '%#{q}%' OR
                        admissions.admission_no like '%#{q}%' OR
                        admissions.father_name like '%#{q}%' OR
                        admissions.mother_name like '%#{q}%' OR
                        admissions.local_guardian_name like '%#{q}%' OR
                        admissions.student_category like '%#{q}%' OR
                        admissions.city like '%#{q}%' OR
                        admissions.address_line1 like '%#{q}%' OR
                        admissions.address_line2 like '%#{q}%')"

    search_conditions = params[:klass].present? ? "#{search_conditions} AND admission_batch_id = #{params[:klass]}" : search_conditions
    #search_conditions = params[:percentage].present? ? "#{search_conditions} AND last_batch_result_in_per <= #{params[:percentage]}" : search_conditions

      search_conditions = "#{search_conditions}" #AND admission_batch_id = #{params[:klass]}"    
      @admissions = Admission.page(page).per(per).where(search_conditions).order(:admission_batch_id)
      @total = Admission.where(search_conditions).count.ceil
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @admissions }
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
    begin
      Admission.transaction do
        #Student pic upload

        @admission = Admission.new(params[:admission])
        
        respond_to do |format|
          if @admission.save!
            if params[:assets]
              asset = Asset.create(params[:assets])
              asset.update_attribute(:attachable, @admission)
            end
            
            format.html { redirect_to edit_admission_path(@admission, :step => 2), notice: 'Admission was successfully created.' }
            format.json { render json: @admission, status: :created, location: @admission }
          else
            format.html { render action: "new" }
            format.json { render json: @admission.errors, status: :unprocessable_entity }
          end
        end
      end
    rescue Exception => e
      ap e.message
      ap e.backtrace.inspect
      render action: "new"
      return
    end
  end

  # PUT /admissions/1
  # PUT /admissions/1.json
  def update
    @admission = Admission.find(params[:id])
    next_step = params[:step] == "2" ? @admission : edit_admission_path(@admission, :step => 2)

    begin
      Admission.transaction do
        #Student pic upload
        asset = nil
        if @admission.asset.nil?
          asset = Asset.create(params[:assets]) if params[:assets]
        else
          @admission.asset.update_attributes(params[:assets]) if params[:assets]
          asset = @admission.asset
        end
        respond_to do |format|
          if @admission.update_attributes(params[:admission])
            asset.update_attribute(:attachable, @admission) unless asset.nil?
            format.html { redirect_to next_step, notice: 'Admission was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @admission.errors, status: :unprocessable_entity }
          end
        end
      end
    rescue Exception => e
      puts "----------------------xxx-----------------------"
      ap e.message
      ap e.backtrace.inspect
      render action: "edit"
      return
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
    @search = Klass.new
    
    sort_fields = [:order_number]
    q, per, page, sort, sort_direction = datatable_params(params[:sSearch],
                                                               params[:iDisplayLength],
                                                               params[:iDisplayStart],
                                                               params[:iSortingCols],
                                                               params[:iSortCol_0],
                                                               params[:sSortDir_0],
                                                               sort_fields)

    search_conditions = "(admissions.student_first_name like '%#{q}%' OR
                        admissions.student_middle_name like '%#{q}%' OR
                        admissions.student_last_name like '%#{q}%' OR
                        admissions.admission_no like '%#{q}%' OR
                        admissions.father_name like '%#{q}%' OR
                        admissions.mother_name like '%#{q}%' OR
                        admissions.local_guardian_name like '%#{q}%' OR
                        admissions.student_category like '%#{q}%' OR
                        admissions.city like '%#{q}%' OR
                        admissions.address_line1 like '%#{q}%' OR
                        admissions.address_line2 like '%#{q}%')"

    #search_conditions = params[:klass].present? ? "#{search_conditions} AND last_batch_result_in_per <= #{params[:klass]}" : search_conditions
    #search_conditions = params[:percentage].present? ? "#{search_conditions} AND last_batch_result_in_per <= #{params[:percentage]}" : search_conditions

    if(params[:klass].present? && params[:percentage].present?)
      search_conditions = "#{search_conditions} AND last_batch_result_in_per <= #{params[:percentage]} AND admission_batch_id = #{params[:klass]}"    
      @admissions = Admission.page(page).per(per).where(search_conditions)
      @total = Admission.where(search_conditions).count.ceil
    end

    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  def student_review
    @admission = Admission.find(params[:id])
  end

end
