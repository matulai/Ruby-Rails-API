Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/personas", to: "personas#get_all_personas", defaults: { format: :json }
  get "/personas/:id", to: "personas#get_user_by_id", defaults: { format: :json }
  post "/personas", to: "personas#add_user", defaults: { format: :json }
  put "/personas/:id", to: "personas#update_user", defaults: { format: :json }
  delete "/personas/:id", to: "personas#delete_user", defaults: { format: :json }

end
