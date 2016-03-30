Rails.application.routes.draw do

  get 'test_result/count'

  root to: 'application#angular'

  mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
                                        token_validations:  'api/v1/auth/token_validations',
                                        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks',
                                        registrations:      'api/v1/auth/registrations',
                                        sessions:           'api/v1/auth/sessions',

                                    }

  get 'api' => 'application#api'

 # get 'api/v1/questions' => 'api/v1/questions#show'

  namespace :api do
    namespace :v1 do
      resources :questions, :only => [:show]
    end
  end



 # post 'api/v1/auth/sessions' => 'api/v1/auth/sessions#create'



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
