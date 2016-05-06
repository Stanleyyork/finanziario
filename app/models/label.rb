class Label < ActiveRecord::Base
	#belongs_to :transaction
	has_one :owner, foreign_key: "transaction_id", class_name: "Transaction"
end
