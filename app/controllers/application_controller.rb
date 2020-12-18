class ApplicationController < ActionController::Base
  include ApplicationHelper

  helper_method :current_admin

  def current_admin
    @current_admin ||= if session[:admin_id]
      Admin.find(session[:admin_id])
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: 'You have to be logged in'
  end
end
