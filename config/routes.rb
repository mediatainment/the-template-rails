MediatainmentProductionsTemplate::Application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do

    mount Mercury::Engine => '/'

    resources :articles

    resources :categories

    resources :roles

    devise_for :users,
               path: "",
               :controllers => {
                   :registrations => "registrations",
                   :sessions => "sessions",
                   :confirmations => "confirmations",
                   :passwords => "passwords"},
               path_names: {
                   sign_in: 'einloggen',
                   sign_up: 'registrieren',
                   sign_out: 'ausloggen',
                   registration: 'registrieren',
                   unlock: 'entsperren',
                   confirmation: 'bestaetigen',
                   password: 'passwort'
               }

    resources :users

    match 'index' => 'index#index', as: :index, via: [:get]
    put 'mercury_update' => 'index#mercury_update', as: :mercury_update
    match 'kontakt' => 'email#contact_form', as: :contact, via: [:get, :post]

    root to: 'index#index'

  end

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
