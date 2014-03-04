class FeeStructuresController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :klass
  load_and_authorize_resource :fee_structure, :through => :klass

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fee_structures }
    end
  end

  # GET /klass_fees/1
  # GET /klass_fees/1.json
  def show
    #@klass_fee = KlassFee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fee_structure }
    end
  end

  # GET /klass_fees/new
  # GET /klass_fees/new.json
  def new
    #@klass_fee = KlassFee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fee_structure }
    end
  end

  # GET /klass_fees/1/edit
  def edit
    #@klass_fee = KlassFee.find(params[:id])
  end

  # POST /klass_fees
  # POST /klass_fees.json
  def create
    #@klass_fee = KlassFee.new(params[:klass_fee])

    respond_to do |format|
      if @klass_fee.save
        format.html { redirect_to klass_klass_fees_path(@klass), notice: 'Klass fee was successfully created.' }
        format.json { render json: @klass_fee, status: :created, location: @klass_fee }
      else
        format.html { render action: "new" }
        format.json { render json: @klass_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /klass_fees/1
  # PUT /klass_fees/1.json
  def update
    #@klass_fee = KlassFee.find(params[:id])

    respond_to do |format|
      if @klass_fee.update_attributes(params[:klass_fee])
        format.html { redirect_to klass_klass_fees_path(@klass), notice: 'Klass fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @klass_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klass_fees/1
  # DELETE /klass_fees/1.json
  def destroy
    #@klass_fee = KlassFee.find(params[:id])
    #@klass_fee.destroy

    respond_to do |format|
      format.html { redirect_to klass_fees_url }
      format.json { head :no_content }
    end
  end
end
