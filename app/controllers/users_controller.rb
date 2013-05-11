class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #load_and_authorize_resource :teacher, :through => :user
  before_filter :load_teacher
  
  # GET /users
  # GET /users.json
  def index
    @title = "User List"
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.name
    if request.xhr?
      render :layout => false and return
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @title = "New User"

    @user = User.new
    @user.user_roles.build
    respond_to do |format|
      format.html #new.html.erb
      format.js
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.user_roles.build
    @title = "Edit #{@user.name}"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if params[:teacher_id].nil?
      @user.save!
      respond_to do |format|
        if @user.save!
          format.html { redirect_to users_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      assign_account(:teacher) #assign account to teacher
    end
    
  end

  def assign_account(type)
    User.transaction do
      @user.save
      respond_to do |format|
        if @teacher.update_attributes({:user_id => @user.id}) #if type == :teacher
          format.html { redirect_to users_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    return
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
      #update_status = @user.update_attributes(params[:user])
      #update_message = "User was successfully updated."

    if params[:origin] == "password-set"
        #update_status = @user.update_with_password(params[:user])
        update_status = @user.update_attributes(:password => params[:user]["password"], :password_confirmation => params[:user]["password_confirmation"])
        update_message = "Password successfully updated."
        @password_update = true
    else
        update_status = @user.update_attributes(params[:user])
        update_message = "User was successfully updated."
    end
    respond_to do |format|
      if update_status
        format.html { redirect_to (can? :read, User) ? users_path : user_path(@user), notice: update_message }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      redirect_to users_path, notice: "You can't delete your account"
      return
    end

    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def assign_roles
    @user = User.find(params[:id])
    @title = "#{@user.first_name}'s Roles"
    @roles = Role.active
  end

  def allocate_roles
    @user = User.find(params[:id])
    if params[:roles].nil?
       flash[:notice] = "Please select atleast one role for user"
       redirect_to users_path
    else
      params[:roles].each do |k, role_id|
        user_role = UserRole.where(:user_id => @user.id, :role_id => role_id)
        if user_role.empty?
          UserRole.create!({:user_id => @user.id, :role_id => role_id, :modified_by => current_user.id})
        end
      end
      redirect_to users_path, notice: "The role is alloacted to #{@user.name}"
      
    end
  end

  def deallocate_roles
    @user = User.find(params[:id])
    if params[:roles].nil?
       flash[:notice] = "Please select atleast one role to deallocate"
       redirect_to users_path
    else
      params[:roles].each do |k, role_id|
        UserRole.destroy_all(:user_id => @user.id, :role_id => role_id)
      end
      redirect_to users_path, notice: "The role is dealloacted from #{@user.name}"
    end
  end

  private
  def load_teacher
    @teacher = Teacher.find(params[:teacher_id]) unless params[:teacher_id].nil?
  end
end

 

