require 'rails_helper'

describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'Allows User create a new category/group' do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')

    sign_in @chef
    visit new_group_path

    fill_in 'Name', with: 'New Category Name'
    select('Shopping', from: 'Icon')

    click_button 'Create category'

    expect(page).to have_content('New Category Name')
  end
end
