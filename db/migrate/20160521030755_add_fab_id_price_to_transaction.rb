class AddFabIdPriceToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :fabricated_price_id, :string
  end
end
