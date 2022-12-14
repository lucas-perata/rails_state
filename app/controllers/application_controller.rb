# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if account_signed_in? 
      @show_sidebar = true 
    end 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :url, :avatar, :company, :phone, :background_img, :details])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :url, :avatar, :company, :phone, :background_img, :details])
  end
end
