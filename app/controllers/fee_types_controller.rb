class FeeTypesController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /fees
  # GET /fees.json
  def index
    #@fee_types = Fee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fee_types }
    end
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
    #@fee_type = Fee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fee_type }
    end
  end

  # GET /fees/new
  # GET /fees/new.json
  def new
    #@fee_type = Fee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fee_type }
      format.js
    end
  end

  # GET /fees/1/edit
  def edit
    #@fee_type = Fee.find(params[:id])
    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @fee_type }
      format.js
    end
  end

  # POST /fees
  # POST /fees.json
  def create
    #@fee_type = Fee.new(params[:fee])

    respond_to do |format|
      if @fee_type.save
        format.html { redirect_to fee_types_path, notice: 'Fee was successfully created.' }
        format.json { render json: @fee_type, status: :created, location: @fee_type }
      else
        format.html { render action: "new" }
        format.json { render json: @fee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fees/1
  # PUT /fees/1.json
  def update
    #@fee_type = Fee.find(params[:id])

    respond_to do |format|
      if @fee_type.update_attributes(params[:fee])
        format.html { redirect_to fee_types_path, notice: 'Fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee_type.destroy

    respond_to do |format|
      format.html { redirect_to fees_url }
      format.json { head :no_content }
    end
  end
end
