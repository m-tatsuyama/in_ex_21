class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :about_in,        null: false
      t.integer :in_amount,      null: false
      t.references :user,        null: false, foreign_key: true
      t.date       :month,       null: false

      t.timestamps
    end
  end
end
