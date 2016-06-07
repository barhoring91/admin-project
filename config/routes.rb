Rails.application.routes.draw do

  #get 'login/signin'
  #post 'login/signin'


  get 'home/index'

  resources :logs, except: [:edit, :new]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :activity_types, except: [:edit, :new]
  resources :admin_users, except: [:edit, :new]

  root 'home#index'

  get 'index' => 'login#index'
  post 'login' => 'login#signin'


  get 'features' => 'features#get_all_features'
  get 'accounts/:app_key' => 'accounts#get_account_info'
  get 'accounts/:app_key/features' => 'accounts#get_account_features'
  post 'accounts/:app_key/features/' => 'accounts#enable_feature'
  delete 'accounts/:app_key/features/:feature_id' => 'accounts#disable_feature'

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
