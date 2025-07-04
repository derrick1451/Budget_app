require 'rails_helper'

describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'Allows User to view the list of groups' do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    # sign_in @chef

    group1 = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png',
                          author: @chef)
    group2 = Group.create(name: 'Group 2', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png',
                          author: @chef)
    group3 = Group.create(name: 'Group 3', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png',
                          author: @chef)

    Payment.create(name: 'Payment 1', amount: 10.50, author: group1.author)
    Payment.create(name: 'Payment 2', amount: 15.75, author: group2.author)
    Payment.create(name: 'Payment 3', amount: 5.25, author: group3.author)

    sign_in @chef
    visit groups_path

    expect(page).to have_content('CATEGORIES')
    expect(page).to have_link('Add New Category', href: new_group_path)
    sleep(5)
  end
end
