class Group < ApplicationRecord
  #  update validations
  belongs_to :author, class_name: 'User'
  has_many :group_payments
  has_many :payments, through: :group_payments
  validates :name, presence: true
  validates :icon, presence: true

  def toal_amount
    payments.sum(:amount)
  end
end
