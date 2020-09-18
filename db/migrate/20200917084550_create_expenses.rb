class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :about_ex,           null: false
      t.integer :ex_amount,         null: false

      t.timestamps
    end
  end
end
