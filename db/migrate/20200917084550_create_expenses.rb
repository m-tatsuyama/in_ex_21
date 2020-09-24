class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string     :about_ex,       null: false
      t.integer    :ex_amount,      null: false
      t.integer    :category_id,    null: false
      t.references :user,        null: false, foreign_key: true
      t.date       :month,          null: false

      t.timestamps
    end
  end
end
