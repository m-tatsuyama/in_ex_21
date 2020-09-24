class Expense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :ex_amount,    presence: true
  validates :category_id,  presence: true
  validates :about_ex,  presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
  end

  belongs_to :user
end
