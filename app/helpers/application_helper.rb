# frozen_string_literal: true

module ApplicationHelper

    def profile_picture account
        thumb = account.avatar.attached? ? (url_for account.avatar.variant(resize_to_limit: [150, 150])) : "placeholder.jpg"
    end 
end
    