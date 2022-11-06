# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_account!, only: %i[new create destroy]
  before_action :set_sidebar, except: [:show, :for_sale, :for_rent, :all]

  def index
    current_account.admin? ? @properties = Property.all  : @properties = Property.where(account_id: current_account.id)
  end

  def show
    @agent = @property.account
    @properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
    @posts = Post.where(account_id: @agent.id)
  end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html do
          redirect_to property_url(@property),
                      notice: 'Property was successfully created.'
        end
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @property.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html do
          redirect_to property_url(@property),
                      notice: 'Property was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @property.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @property.destroy

    respond_to do |format|
      format.html do
        redirect_to properties_url,
                    notice: 'Property was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def email_agent 
    #sent email
    #set a mailer
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]
    ContactMailer.email_agent(agent_id, first_name, last_name, email, message)
  end 

  def for_sale
    @properties = Property.sale
  end 

  def for_rent
    @properties = Property.rent
  end 

  def all 
    @properties = Property.all
  end 

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def set_sidebar
    @show_sidebar = true
  end

  def property_params
    params.require(:property).permit(
      :name,
      :address,
      :price,
      :rooms,
      :square_meters,
      :bathrooms,
      :parking_spaces,
      :details,
      :status,
      :available_date,
      images: []
    )
  end
end
