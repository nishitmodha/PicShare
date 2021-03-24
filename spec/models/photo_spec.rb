require 'rails_helper'

RSpec.describe Photo, type: :model do
  before(:all) do
    @photo = create(:photo)
  end

  it 'ensures photo is valid' do
    expect(@photo).to be_valid
  end

  describe "Associations" do
		it { expect(@photo).to belong_to(:user) }
		it { expect(@photo).to have_one_attached (:user_photo) }
		it { expect(@photo).to have_many (:comments) }
	end
end