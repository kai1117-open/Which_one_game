class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :admin_namespace?, unless: -> { controller_name == "home" && action_name == "index" }

  private

  def authenticate_admin!
    unless admin_signed_in?
      redirect_to new_admin_session_path, alert: "管理者としてログインしてください"
    end
  end

  def admin_namespace?
    controller_path.start_with?("admin/")
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      root_path
    elsif resource.is_a?(Admin)
      admin_home_index_path # 管理者向けのトップページ
    else
      root_path
    end
  end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    elsif resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    end
  end
end
