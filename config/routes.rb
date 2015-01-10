Furnitureapp::Application.routes.draw do
  

 
  devise_for :admins
  devise_for :users
  # get "homes/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  namespace :admin do
    resources :orders do
      collection do
        get :guest_orders
        get :user_orders
      end
    end
    resources :products do
      member do
        delete :delete_img
        put :image_show
        put :flag
      end
    end
    resources :categories do
      member do
        get :category_show
      end
    end
    resources :dashboards
    # resources :offers 
  end
  resources :welcome do 
#    member do
#      get :category
#    end
  end  # You can have the root of your site routed with "root"
  
  
  resources :profiles do
    member do
      put :update_profile
      put :change_password
      
    end
  end
  
  
  resources :homes do
    collection do
      get :offers
      get :how_to_buy
      get :faq
      get :payment
      get :shipment
      get :terms
      get :return_policy
      get :search
    end
    member do
      get :single_product
    end
  end 
  
  resources :line_items
  resources :carts
  
  resources :orders do
    member do
      get :confirm
      get :confirm_myorder
      match :cancel_order, via: [:get, :put]
    end
    collection do 
      get :myorder
      get :checkout_information
    end
  end


  
  root 'homes#index'
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