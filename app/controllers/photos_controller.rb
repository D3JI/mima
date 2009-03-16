class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = User.find(params[:user_id])
    user_data = { :user_id => @user.id }
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new(params[:photo].merge(user_data))

    if @photo.save
      flash[:notice] = '照片上传成功!'
      redirect_to user_album_path(:id => @album)
    else
      render :action => "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments.find(:all, :order => 'created_at desc')
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      flash[:notice] = '照片更新成功!'
      redirect_to user_album_photos_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_album_photos_path(:album_id => @photo.album)
  end

  #用于设置相册封皮的
  def set_primary
    @photo = Photo.find(params[:id])
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:album_id])
    @old_primary = @album.photos.select(&:primary?)

    if @photo.update_attributes(:primary => true)
      @old_primary.each { |p| p.update_attributes!(:primary => false) }
      redirect_to user_album_path(:id => @album)
    end
  end

  # Put set_avatar_album_photo_path
  #用于设置用户头像的
  def set_avatar
    @photo = Photo.find(params[:id])
    @old_avatar = logged_in_user.photos.select(&:avatar?)

    if @photo.update_attributes(:avatar => true)
      @old_avatar.each { |p| p.update_attributes!(:avatar => false) }
      redirect_to user_path(:user_id => @photo.user)
    end
  end
end
