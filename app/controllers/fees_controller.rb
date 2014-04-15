class FeesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /fees
  # GET /fees.json
  def index
    #@fees = Fee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fees }
    end
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
    #@fee = Fee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fee }
    end
  end

  # GET /fees/new
  # GET /fees/new.json
  def new
    #@fee = Fee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fee }
      format.js
    end
  end

  # GET /fees/1/edit
  def edit
    #@fee = Fee.find(params[:id])
    respond_to do |format|
      format.html { render :layout => !request.xhr?}
      format.json { render json: @fee }
      format.js
    end
  end

  # POST /fees
  # POST /fees.json
  def create
    #@fee = Fee.new(params[:fee])

    respond_to do |format|
      if @fee.save
        format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
        format.json { render json: @fee, status: :created, location: @fee }
      else
        format.html { render action: "new" }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fees/1
  # PUT /fees/1.json
  def update
    #@fee = Fee.find(params[:id])

    respond_to do |format|
      if @fee.update_attributes(params[:fee])
        format.html { redirect_to @fee, notice: 'Fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee = Fee.find(params[:id])
    @fee.destroy

    respond_to do |format|
      format.html { redirect_to fees_url }
      format.json { head :no_content }
    end
  end
end
