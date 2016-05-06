class User < ActiveRecord::Base
	has_secure_password
	has_many :transactions
	has_many :labels
end
