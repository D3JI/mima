ActionController::Routing::Routes.draw do |map|
  map.resources :users do |user|
    user.resources :entries do |entry|
      entry.resources :comments
    end
    user.resources :albums do |album|
      album.resources :photos, :member => {:set_primary => :put, :set_avatar => :put } do |photo|
        photo.resources :comments
      end
    end
  end
  map.login '/login', :controller => 'account', :action => 'login'
  map.logout '/logout', :controller => 'account', :action => 'logout'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.home '', :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
