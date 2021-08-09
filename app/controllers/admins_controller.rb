class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :set_new_admin, only: [:new, :create]

  load_and_authorize_resource

  helper_method :admin

  # GET /admins
  def index
  end

  # GET /admins/new
  def new
    set_new_admin(Admin.new)
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    set_new_admin(Admin.new(admin_params))
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully created." }
        session[:admin_id] ||= admin.id
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admins/1
  def update
    respond_to do |format|
      if admin.update(admin_params)
        format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admins/1
  def destroy
    admin.destroy
    if admin == current_admin
      session[:admin_id] = nil
      respond_to do |format|
        format.html { redirect_to root_path, notice: "admin: #{@admin.email} was successfully deleted." }
      end
    else
      respond_to do |format|
        format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully deleted." }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_new_admin(admin_entity = nil)
    @admin = admin_entity
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def admin
    @admin
  end
end
