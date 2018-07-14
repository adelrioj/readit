Rails.application.routes.draw do
  root "stories#index"

  # When using the singular form, Rails knows we're talking about a singleton resource
  resource :session

  resources :stories do
    collection do
      get "bin"
    end
    resources :votes do
    end
  end
end
