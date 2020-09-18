class Expense < ApplicationRecord
  validates :ex_amount,   presence: true
  validates :about_ex,    presence: true
end
