require 'rails_helper'

RSpec.describe @user, type: :model do
  context 'validation tests' do
    before(:all) do
      @user = create(:user)
    end
    
    it 'ensures user_name presence' do
      @user.user_name = nil
      expect(@user).to_not be_valid
    end
    
    it 'ensures email presence' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    
    it 'ensures password presence' do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    
    it 'should save successfully' do 
      user = build(:user)
      expect(user).to be_valid
    end
    
    describe "Associations" do
      it { expect(@user).to have_many(:photos) }
      it { expect(@user).to have_many(:comments) }
    end
  end

end