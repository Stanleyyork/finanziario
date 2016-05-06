class Transaction < ActiveRecord::Base
	belongs_to :user
	has_many :labels
end
