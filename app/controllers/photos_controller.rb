class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :like, :unlike]
  before_action :auth, only: [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

  def index
    @photos = Photo.all
  end

  def show
  end
  
  def new
    @photo = current_user.photos.build
  end
  
  def edit
  end

  def create
    @photo = current_user.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @photo.liked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def unlike
    @photo.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private
    
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def auth
      if @photo.user != current_user
        respond_to do |format|
        format.html {redirect_to root_path, notice: 'Not authorized!!' }
        end
      end
    end
    
    def photo_params
      params.require(:photo).permit(:title, :description, :user_photo)
    end
end
