# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :properties
  has_one_attached :avatar
  has_one_attached :background_img
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable
end
