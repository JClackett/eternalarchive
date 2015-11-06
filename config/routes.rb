Rails.application.routes.draw do
  

  # get 'application/help' ,:path => "help"

  get 'application/about', :path => "about"

  # get 'application/contact_us', :path => "contact_us"

  get 'application/copyright', :path => "copyright"


  devise_for :users
  resources :contributions, except: [:show, :new]
  get 'submit' => 'contributions#new'


  resources :categories, except: :show
  
  resources :posts do
    member do
      get 'like', to: 'posts#upvote'
      get 'bookmark'
    end
  end

  get 'posts/topvids', :path => "top_videos"
  get 'posts/mostrecent', :path => "latest"
  get 'posts/shuffle', :path => "shuffle"

  get 'profile' => 'posts#profile'

  # resources :users, only: [:show]

  root 'posts#index'
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
