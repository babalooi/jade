Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'job_ads#index'

  resources :job_ads
  resources :job_applications

  devise_for :users
end
