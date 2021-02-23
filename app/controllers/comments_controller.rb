class CommentsController < ApplicationController
    before_action :set_comment, only: [:create, :destroy]
    before_action :authenticate_user!, only: [:create, :destroy]
  
    def create
        @photo = Photo.find(params[:photo_id]) 
        @comment = @photo.comments.create(comment_params)
        @comment.user_id = current_user.id if current_user
        @comment.save!
  
        redirect_to photo_path(@photo)
    end
  
    def destroy
      @comment = @photo.comments.find(params[:id])
      @comment.destroy
  
      redirect_to photo_path(@photo)
    end
  
    private
  
    def set_comment
      @photo = Photo.find(params[:photo_id])
    end
  
    def comment_params
      params.require(:comment).permit(:user_name, :message)
    end
  end
  