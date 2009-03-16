class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums.find(:all, :order => 'created_at DESC')
  end

  def new
    @album = Album.new
  end

  def create
    @user = User.find(params[:user_id])
    @album = @user.albums.new(params[:album])

    if @album.save
      flash[:notice] = '相册创建成功!'
      redirect_to user_albums_path
    else
      render :action => "new"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      flash[:notice] = "相册更新成功!"
      redirect_to user_albums_path(:user_id => @user.id )
    else
      render :action => "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to user_albums_path
  end
end
