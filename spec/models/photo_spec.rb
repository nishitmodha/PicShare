require 'rails_helper'

RSpec.describe Photo, type: :model do
  before(:all) do
    @photo = create(:photo)
  end

  it 'ensures photo is valid' do
    expect(@photo).to be_valid
  end

end