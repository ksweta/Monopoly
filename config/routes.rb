Rails.application.routes.draw do
  devise_for :users
  resources :game

  get 'game/index'
  get 'game/board'
  get '/game/buttons' => 'game#buttons'
  get 'host_game/host'
  get 'welcome/index'

  post 'welcome/submit'
  post 'pusher/auth'
  post 'game/chat_message'
  post 'game/start_button'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'
  root "sign_in#index"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/welcome' => 'welcome#index'
  get '/game/' => 'game#index'
  get '/game/list' => 'game#index'
  get 'game/game/destroy' => 'game#destroy'
  post '/game/create' => 'game#create'
  get '/game/game/new' => 'game#create'
  get '/game/game/join' => 'game#join'
  get '/game/join' => 'game#join'

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
