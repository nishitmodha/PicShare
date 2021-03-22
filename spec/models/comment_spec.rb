require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment = create(:comment)
  end

  it "valid?" do
    expect(@comment).to be_valid
  end
end