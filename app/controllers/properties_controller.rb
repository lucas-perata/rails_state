# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_account!, only: %i[new create destroy]
  before_action :set_sidebar, except: [:show]

  def index
    @properties = Property.all
  end

  def show
    @agent = @property.account
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
      images: []
    )
  end
end
