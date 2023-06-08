Rails.application.routes.draw do
  root 'home#index'

  resources :employees
  resources :documents

  # Public pages routes
  get 'about' => 'pages#about_us'
  get 'contact' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-and-conditions' => 'pages#terms_and_conditions'
  
end
