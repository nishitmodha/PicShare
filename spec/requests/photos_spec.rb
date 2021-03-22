require 'rails_helper'
require 'support/auth_helper'
include AuthHelper

RSpec.describe "Photos", type: :request do
  let(:user) { create(:user) }
  
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

  
  describe 'PATCH #edit' do
    # let :photo do
    #   post "/photos", :params => { photo: attributes_for(:photo) }
    # end
    # it 'renders the edit page of photo' do
    #   get "/photos/#{photo.id}/edit", params: { id: photo.id,
    #                                              photo: attributes_for(:photo)}
    
    let(:photo) { create(:photo) }
    it 'edits' do
      get edit_photo_path(:photo)  
      expect(response).to render_template :edit
    end
    
  end

  # describe 'Delete Photo#destroy' do
  #   context 'with valid params' do
  #     let(:delete_photo) do
  #       delete photo_path(:photo)
  #     end

  #     it { expect { delete_photo }.to change(Photo, :count).by(1) }
  #   end
  # end

  # describe 'Delete Photo#destroy' do
  #   context 'Delete photo' do
  #     it 'deletes stuff' do
  #       delete photo_path(:photo)
  #       expect (response).to redirect_to photos_url
  #     end
  #   end
  # end



end