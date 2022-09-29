# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :account
  has_many_attached :images

  scope :latest, -> { order created_at: :desc }
  scope :sold, -> {where status: "Sold"}
  scope :rented, -> {where status: "Rented"}
  scope :sale, -> {where status: "Sell"}
  scope :rent, -> {where status: "Rent"}
end
