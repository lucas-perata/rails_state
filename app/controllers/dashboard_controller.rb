# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :set_sidebar

  def index; end

  def properties; end

  def profile 
    @agent = Account.find(params[:id])
    @posts = Post.where(account_id: @agent.id)
    @properties = Property.where(account_id: @agent.id)
    @properties_sold = Property.where(account_id: @agent.id).sold.count 
    @properties_rented = Property.where(account_id: @agent.id).rented.count 
    @properties_sale = Property.where(account_id: @agent.id).sale.count 
    @properties_rent = Property.where(account_id: @agent.id).rent.count 
  end 

  private

  def set_sidebar
    @show_sidebar = true if account_signed_in?
  end
end
