class TransactionsController < ApplicationController

  require './app/providers/import_provider'

  def update
  end

  def edit
  end

  def import_csv
    import = ImportCsvProvider.new(User.find(1), params[:shared_user_id], params[:shared_percent])
    import.first_or_nth_import(params[:file])

    redirect :root
  end

  def destroy
  end

  def index
    @label = Label.all
    @transaction_count = Transaction.count
    @transactions = Transaction.order("transaction_date DESC").limit(100)
  end

  def show
  end
end
