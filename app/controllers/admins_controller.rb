class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]

  load_and_authorize_resource

  helper_method :admins, :admin

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admins/1
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admins/1
  def destroy
    admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: "admin: #{@admin.email} was successfully deleted." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def admins
    @admins ||= Admin.all
  end

  def admin
    @admin
  end
end
