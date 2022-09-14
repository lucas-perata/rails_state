# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :properties
  has_one_attached :avatar
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  def company
    "test company"
  end 
end
