require 'rails_helper'
RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'derrick', email: 'hell@gmail.com', password: 'hggfgfg')
    sign_in @user
  end
  describe 'Validations' do
    it 'name should be present' do
      @user.name = ''
      expect(@user).to_not be_valid
    end
    it 'email should be present' do
      @user.email = 'h@gmail.com'
      expect(@user).to be_valid
    end
  end
end
