Greissue::Application.routes.draw do

  devise_for :users  do
    resources :thoughts
  end
  resources :users, only: [:show]
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :topic_groups do
    collection {post :import }
  end



  resources :group_relationships, only: [:create, :destroy]  do
    collection {post :import }
  end

  resources :categories


  resources :instructions do
    collection {post :import }
  end

  resources :thoughts

  resources :topics do
    collection do
      post :import
      #get :autocomplete_tag_name
    end
    resources :thoughts do
      member { post :vote }
    end
  end



  get 'tags/:tag', to: 'topics#index', as: :tag

  root :to => 'topics#index'
  match 'nav' => 'static_pages#navigation'
  match 'import' => 'static_pages#import'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
