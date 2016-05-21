class Transaction < ActiveRecord::Base
	belongs_to :user
	has_many :labels, :dependent => :destroy
end
