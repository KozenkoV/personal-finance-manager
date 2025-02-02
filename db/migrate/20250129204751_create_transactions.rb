class CreateTransactions < ActiveRecord::Migration[8.0]
  
  def change
    create_table :transactions do |t|
      t.string :transaction_type, null: false
      t.text :description, null: false, default: ''
      t.float :total, null: false, default: 0.0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
  
end
