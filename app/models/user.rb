class User < ActiveRecord::Base
	has_secure_password
	has_many :transactions, :dependent => :destroy
	has_many :labels, :dependent => :destroy
end
