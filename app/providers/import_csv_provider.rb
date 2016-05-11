class ImportCsvProvider
	include CSVImporter

	def initial_import(current_user)

		model Transaction

		# column :email, to: ->(email) { email.downcase }, required: true
		# column :first_name, as: [ /first.?name/i, /pr(é|e)nom/i ]
		# column :last_name,  as: [ /last.?name/i, "nom" ]
		# column :published,  to: ->(published, user) { user.published_at = published ? Time.now : nil }
		# identifier :email # will update_or_create via :email
		# when_invalid :skip # or :abort

		column :user_id, to: current_user.id
		column :mint_date, to: ->(Date)
		column :mint_description, to: ->(Description)
		column :mint_original_description, to: ->(Original Description)
		column :mint_amount, to: ->(Amount) { Amount.to_f }
		column :mint_transaction_type, to: ->(Transaction Type)
		column :mint_category, to: ->(Category)
		column :mint_account_name, to: ->(Account Name)
		column :mint_labels, to: ->(Labels)
		column :mint_notes, to: ->(Notes)
		column :day_number_of_week, to: ->(Date) { Date }
		column :day_number_of_month, to: ->(Date) { Date.split("/")[1].to_i }
		column :day_of_week, to: ->(Date) { Date }
		column :month, to: ->(Date) { Date }
		column :month_number, to: ->(Date) { Date.split("/")[0].to_i }
		column :year, to: ->(Date) { Date.split("/")[2].to_i }

		identifier :user_id, :mint_original_description, :mint_transaction_type
	end

end

"day_number_of_week"
    t.integer  "day_number_of_month"
    t.string   "day_of_week"
    t.string   "month"
    t.integer  "month_number"
    t.integer  "year"