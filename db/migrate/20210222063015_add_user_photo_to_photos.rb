class AddUserPhotoToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :user_photo, :string
  end
end
