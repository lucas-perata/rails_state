class Property < ApplicationRecord
    belongs_to :account, class_name: "account", foreign_key: "account_id"
end
