class ImportCsvProvider
	require 'csv'
	require 'roo'

	def initialize(current_user, shared_user_id, shared_percent)
		@current_user = current_user
		@shared_user_id = shared_user_id.nil? ? nil : shared_user_id
		@shared_percent = shared_percent.present? ? shared_percent.to_f/100 : 1
	end

	def first_or_nth_import(file)
		end_point = @current_user.transactions.order("transaction_date DESC").limit(1).pluck(:mint_date)[0]
		end_point ? iterate(file, end_point) : iterate(file, 'All')
	end

	def iterate(file, end_point)
		spreadsheet = Roo::Spreadsheet.open(file, extension: :csv).sheet(0)
		(2..spreadsheet.last_row).each do |i|
			break if spreadsheet.row(i)[0] == end_point
			save(spreadsheet.row(i))
	  	end
	end

	def save(row)
		shared_cost = row[7] == 'Shared CC' ? true : false
		date = Date.new(row[0].split("/")[2].to_i, row[0].split("/")[0].to_i, row[0].split("/")[1].to_i)
		attributes = {
	    	:mint_date => row[0],
	    	:mint_description => row[1],
	    	:mint_original_description => row[2],
			:mint_amount => row[3].to_f,
			:mint_transaction_type => row[4],
			:mint_category => row[5],
			:mint_account_name => row[6],
			:mint_labels => row[7],
			:mint_notes => row[8],
			:transaction_date => date,
			:day_number_of_week => date.wday,
			:day_number_of_month => date.strftime('%d'),
			:day_of_week => date.strftime('%a'),
			:month => date.strftime('%b'),
			:month_number => date.month,
			:year => date.year,
			:transaction_amount => row[3].to_f,
			:adjusted_transaction_amount => row[3].to_f * @shared_percent,
			:transaction_abs_amount => row[3].to_f.abs,
			:transaction_debit_credit => row[4],
			:category => row[5],
			:fabricated_id => "#{row[2]}-#{row[4]}-#{date.strftime('%b')}-#{date.year}",
			:fabricated_price_id => "#{row[3]}-#{row[2]}-#{row[4]}-#{date.strftime('%b')}-#{date.year}",
			:user_id => @current_user.id
	    }
	    shared_attributes = {
	    	:shared_cost => shared_cost,
			:shared_percent => @shared_percent,
			:shared_user_id => @shared_user_id
	    }
	    t = Transaction.new
	    t.attributes = attributes
	    t.save!
	    t.update_attributes(shared_attributes) if shared_cost
	    save_labels(row[7], t.id)
	end

	def save_labels(data, t_id)
		data.split(" ").each do |label|
			attributes = {
				:name => label,
				:transaction_id => t_id,
				:user_id => @current_user.id,
				:mint => true
			}
			Label.create(attributes)
		end
	end

end