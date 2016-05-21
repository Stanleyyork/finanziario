class TransactionsController < ApplicationController

  require './app/providers/import_provider'

  def revenuecost
    labels_array = ["FastAsSamFund", "SharedCC", "Reimbursable"]
    @revenue = Hash[base_months(Transaction.where(transaction_debit_credit: 'credit').where(year: 2015).joins(:labels).where("labels.name NOT IN (?)", labels_array).group(:month_number).sum(:adjusted_transaction_amount)).sort].values
    @cost = Hash[base_months(Transaction.where(transaction_debit_credit: 'debit').where(year: 2015).joins(:labels).where("labels.name NOT IN (?)", labels_array).group(:month_number).sum(:adjusted_transaction_amount)).sort].values
    @profit = (0..11).map {|i| @revenue[i] - @cost[i]}
    render :json => {revenue: @revenue, cost: @cost, profit: @profit, total_profit: @profit.sum}
  end

  def base_months(a)
    base_months = {1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>0, 11=>0, 12=>0}
    a.merge!(base_months) { |k, o, n| o + n }
  end

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
