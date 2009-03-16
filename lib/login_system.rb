module LoginSystem
  protected
  def is_logged_in?
    @logged_in_user = User.find(session[:user]) if session[:user]
  end
  def logged_in_user
    @logged_in_user if is_logged_in?
  end
  def logged_in_user=(user)
    if !user.nil?
      session[:user] = user.id
      session[:updated] = Time.now
      @logged_in_user =user
    end
  end
  def self.included(base)
    base.send :helper_method, :is_logged_in?, :logged_in_user
  end

  def login_required
    unless is_logged_in?
      flash[:error] = "请先登录"
      redirect_to login_path
    end
  end
end
