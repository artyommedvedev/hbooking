Rails.application.routes.draw do
 # get 'interaction/welcome'
  #post 'interaction/welcome', :to => 'interaction#show'
  #get 'interaction/confirm'
 # post 'interaction/confirm'
  #get 'interaction/show'
  #post 'interaction/create'

  root 'bookings#welcome'
  post 'bookings/welcome' => 'rooms#available'

  get 'admin', :to => "admin#login"
  get 'admin/menu', :to => "admin#menu"
  get 'admin/login', :to => "admin#login"
  get 'admin/logout', :to => "admin#logout"
  get 'admin/show', :to => "admin#show"
  post 'admin/attempt_login', :to => "admin#attempt_login"

  get 'admin/new' => "admin#new"
  post 'admin/new' => "admin#create"
  delete 'admin/(:id)' =>"admin#delete"

  #match ':controller(/:action)', :via => [:get, :post]
  #match ':controller(/:action(/:id))', :via => [:get, :post]

  #get 'bookings/login', :to => "bookings#login"
  #post 'bookings(/:id)/login', :to => "admin#login"

  resources :bookings
  resources :rooms
  resources :room_types

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
