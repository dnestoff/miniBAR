Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tabs, only: [:edit, :update, :show] do
    resources :drinks, only: [:index]
  end
  resources :tab_items, only: [:create, :destroy]

  resources :patrons, except: [:index, :show, :destroy] do
    resources :tabs, only: [:new, :create]
  end

  resources :bars, except: [:destroy, :show] do
    resources :tabs, only: [:index]
  end
  resources :welcome, only: [:show, :index]

  get '/patrons/payment_method' => 'patrons#payment_method'
  post '/patrons/create_bt_customer' => 'patrons#create_bt_customer'
  get '/bars/merchant_account' => 'bars#merchant_account'
  post '/bars/create_bt_merchant' => 'bars#create_bt_merchant'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'bars/:id/settings' => 'bars#settings', as: 'settings'
  mount ActionCable.server => '/cable'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


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
