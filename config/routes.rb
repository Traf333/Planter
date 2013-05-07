Plants::Application.routes.draw do

  root :to => 'root#index'

  get 'profile' => 'profile#me'
  get 'profile/member'
  get 'profile/catalog'
  put 'profile/update_member'
  post 'profile/update_member'
  put 'profile/update_me'
  post 'profile/update_me'
  get 'profile/new_price'
  put 'profile/save_price'
  post 'profile/save_price'
  put 'profile/update_plant_price'
  post 'profile/update_plant_price'
  post 'profile/remove_plant_price'
  delete 'profile/remove_member_price'

  devise_for :users, :path => "auth", :path_names => {:sign_in => 'login',
                                                      :sign_out => 'logout',
                                                      :password => 'secret',
                                                      :confirmation => 'verification',
                                                      :unlock => 'unblock',
                                                      :registration => 'register',
                                                      :sign_up => 'cmon_let_me_in'},
             :controllers => {:registrations => "registrations"}


  resources :members
  resources :plants
  resources :images

  namespace :control do

    root :to => 'users#index'

    resources :members
    resources :plants
    resources :users
    resources :member_categories
    resources :regions
    resources :countries
    resources :plant_categories
    resources :plant_features
    resources :genus
  end

end
