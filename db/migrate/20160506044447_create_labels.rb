class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :transaction_id
      t.integer :user_id
      t.boolean :mint

      t.timestamps null: false
    end
  end
end
