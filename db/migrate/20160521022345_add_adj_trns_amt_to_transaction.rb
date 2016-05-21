class AddAdjTrnsAmtToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :adjusted_transaction_amount, :float
  end
end
