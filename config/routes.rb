ActionController::Routing::Routes.draw do |map|
  map.resources :users do |user|
    user.resources :entries
    user.resources :albums do |album|
      album.resources :photos, :member => {:set_primary => :put, :set_avatar => :put }
    end
  end
  map.login '/login', :controller => 'account', :action => 'login'
  map.logout '/logout', :controller => 'account', :action => 'logout'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.home '', :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
