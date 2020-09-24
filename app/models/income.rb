class Income < ApplicationRecord
  validates :in_amount,   presence: true
  validates :about_in,    presence: true

  belongs_to :user
end
