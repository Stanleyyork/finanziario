class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :mint_date
      t.string :mint_description
      t.string :mint_original_description
      t.float :mint_amount
      t.string :mint_transaction_type
      t.string :mint_category
      t.string :mint_account_name
      t.string :mint_labels
      t.string :mint_notes
      t.integer :day_number_of_week
      t.integer :day_number_of_month
      t.string :day_of_week
      t.string :month
      t.integer :month_number
      t.integer :year
      t.float :transaction_amount
      t.float :transaction_abs_amount
      t.string :transaction_debit_credit
      t.boolean :shared_cost
      t.float :shared_percent
      t.integer :shared_user_id
      t.string :financial_institution
      t.string :merchant
      t.string :category
      t.string :fabricated_id
      t.boolean :possible_duplicate

      t.timestamps null: false
    end
  end
end
