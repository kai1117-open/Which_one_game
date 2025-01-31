class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  



  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      root_path
    elsif resource.is_a?(Admin)
      admin_dashboard_path # 管理者向けのダッシュボードページへリダイレクト（適宜変更）
    else
      root_path
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
