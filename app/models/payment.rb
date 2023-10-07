class Payment < ApplicationRecord
  #  update validations
  belongs_to :author, class_name: 'User'
  has_many :group_payments
  has_many :groups, through: :group_payments
  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :amount, numericality: { only_integer: true }
end
