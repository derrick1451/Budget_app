require 'rails_helper'

describe 'Payments', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'Allows User to view the list Payments per Category' do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')

    group1 = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png',
                          author: @chef)

    Payment.create(name: 'Payment 1', amount: 10, author: @chef, groups: [group1])
    Payment.create(name: 'Payment 2', amount: 10, author: @chef, groups: [group1])
    Payment.create(name: 'Payment 3', amount: 10, author: @chef, groups: [group1])

    sign_in @chef
    visit group_payments_path(group1)

    expect(page).to have_content('Transactions')
    expect(page).to have_content('total amount: $30')

    expect(page).to have_content('Payment 1')
    expect(page).to have_content('$10')
    expect(page).to have_content('Payment 2')
    expect(page).to have_content('$10')

    expect(page).to have_link('Add new transaction', href: new_group_payment_path(group1))
  end
end
