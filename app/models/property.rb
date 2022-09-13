# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :account
  has_many_attached :images 

  scope :latest, -> {order created_at: :desc}
end
