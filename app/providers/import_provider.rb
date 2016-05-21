class ImportProvider
	require './app/providers/import_csv_provider'

	def initialize(current_user, shared_user, imported_file)
		@current_user = current_user
		@shared_user = shared_user
		first_or_nth_import(imported_file)
	end

	def first_or_nth_import(imported_file)
		ActualImport(imported_file)
	end

	def ActualImport(imported_file)
		# import = ImportCsvProvider.new(file: imported_file) do
	 #      after_build do |transaction|
	 #        transaction.user_id = 1
	 #        if transaction.shared_cost
	 #          transaction.shared_percent = 0.5
	 #          transaction.shared_user_id = 2
	 #        end
	 #      end
	 #    end
	 import = ImportCsvProvider.new(file: imported_file)
	 import.run! if import.valid_header?
	end

end