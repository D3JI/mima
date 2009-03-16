class EntriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @entries = @user.entries.find(:all, :order => 'created_at DESC')
  end

  def new
    @entry = Entry.new
    @user = User.find(params[:user_id])
    #@categories = EntryCategory.find(:all)
  end

  # POST /entries
  def create
    @user = User.find(params[:user_id])
    @entry = @user.entries.new(params[:entry])
    if @entry.save
      flash[:notice] = '日志已经成功创建'
      redirect_to user_entries_path
    else
      render :action => "new"
    end
  end

  def show
    #@user = User.find(params[:user_id])
    @entry = Entry.find(params[:id])
    @comments = @entry.comments.find(:all, :order => 'created_at DESC')
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
      if @entry.update_attributes(params[:entry])
        flash[:notice] = '日志更新成功!'
       redirect_to user_entry_path(:id => @entry)
      else
      render :action => "edit"
      end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to user_entries_path(:user_id => @entry.user)
  end
end
