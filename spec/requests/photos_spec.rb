require 'rails_helper'
require 'support/auth_helper'
include AuthHelper

RSpec.describe "Photos", type: :request do
  let(:user) { create(:user) }
  let(:photo) { create(:photo) }

  
  before(:each) do
    login_user
   end

  describe "GET /index" do
      it 'ensures index returns photos' do
        get photos_path
        expect(response).to be_successful 
      end
  end

  describe 'GET #new' do
    it 'New Photo' do
      get '/photos/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST Photo#create' do
    context 'with valid params' do
      let :photo do
        post "/photos", :params => { photo: attributes_for(:photo) }
      end
      it { expect { photo }.to change(Photo, :count).by(1) }
    end

  context 'with invalid params' do
    let :photo do
      post "/photos", :params => { photo: attributes_for(:photo, title: nil) }
    end
      it { expect { photo }.not_to change(Photo, :count) }
    end
  end

  describe 'GET Photo#Show' do
    it 'renders show page' do
      get photo_path(photo)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe "PUT /update/:id" do
    context "with valid params" do
      it "updates photo and redirects" do
        put photo_path(photo), :params => { photo: attributes_for(:photo) }
        expect(response).to be_redirect
      end
    end
  end

  describe "DELETE /destroy/:id" do
    context "with valid params" do
      it "deletes photo and redirects" do
        delete photo_path(photo)
        expect(response).to be_redirect
      end
    end
  end

end