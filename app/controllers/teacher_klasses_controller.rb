class TeacherKlassesController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :klass
  load_and_authorize_resource :teacher_klass, :through => :klass

  def index

  end

  def show
    
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @teacher_klass }
    end
  end

  def create
    respond_to do |format|
      if @teacher_klass.save
        format.html { redirect_to @teacher_klass, notice: 'Teacher was successfully created.' }
        format.json { render json: @van, status: :created, location: @van }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher_klass.errors, status: :unprocessable_entity }
      end
    end
  end

end
