class AdmissionDocumentsController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource
  load_and_authorize_resource :admission
  load_and_authorize_resource :admission_document, :through => :admission

  def index
    respond_to do |format|
      format.html
      format.json { render json: @admission_documents }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @admission_document }
    end
  end

  def create
    puts "=========================="
    ap @admission_document

    begin
      AdmissionDocument.transaction do
        @admission_document = AdmissionDocument.new(params[:admission_document])
        respond_to do |format|
          if @admission_document.save!
            if params[:attachments]
              asset = Attachment.create(params[:attachments])
              asset.update_attribute(:bindable, @admission_document)
            end

            format.html { redirect_to new_admission_admission_document_path(@admission_document), notice: 'Admission was successfully created.' }
            format.json { render json: @admission_document, status: :created, location: @admission_document }
          else
            format.html { render action: "new" }
            format.json { render json: @admission_document.errors, status: :unprocessable_entity }
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
end
