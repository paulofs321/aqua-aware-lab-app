Rails.application.routes.draw do
  root 'home#index'

  resources :water_quality_tests, only: %i[show edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
