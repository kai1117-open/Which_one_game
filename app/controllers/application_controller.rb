class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 管理者用の認証を適用
  before_action :authenticate_admin!, if: :admin_namespace?

  # 一般ユーザーの認証（管理者領域では適用しない）
  before_action :authenticate_user!, unless: :admin_namespace?

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
