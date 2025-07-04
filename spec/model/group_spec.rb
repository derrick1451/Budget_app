require 'rails_helper'
RSpec.describe Group, type: :model do
  include Devise::Test::IntegrationHelpers

  before :each do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @chef
    @group = Group.new(
      name: 'jolof rice',
      icon: 'https://www.google.com',
      author: @chef
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end

    it 'requires a name' do
      @group.name = ''
      expect(@group).to_not be_valid
      expect(@group.errors[:name]).to include("can't be blank")
    end

    it 'requires a icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
