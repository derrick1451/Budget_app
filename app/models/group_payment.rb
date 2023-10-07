class GroupPayment < ApplicationRecord
#  update validations
  belongs_to :payment
  belongs_to :group
end
