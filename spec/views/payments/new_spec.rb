require 'rails_helper'

describe 'Transactions', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'should create a new transaction' do
    user = User.create!(
      name: 'Abel Morara',
      email: 'abelmorara254@gmail.com',
      password: '123456'
    )

    group = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', author: user)

    sign_in user
    visit new_group_payment_path(group)

    fill_in 'Name', with: 'New Transaction'
    fill_in 'Amount', with: 25

    click_button 'Save transaction'

    expect(page).to have_content('New Transaction')
    expect(page).to have_content('$25')

    # find('.arrow').click
    # expect(page).to have_content(group.name.to_s)
    # expect(page).to have_link('Add a New Group', href: new_group_path)
  end
end
