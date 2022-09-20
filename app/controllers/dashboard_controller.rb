# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :set_sidebar

  def index; end

  def properties; end

  def profile 
    @account = Account.find(params[:id])
  end 

  private

  def set_sidebar
    @show_sidebar = true if account_signed_in?
  end
end
