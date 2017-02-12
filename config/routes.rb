Rails.application.routes.draw do
  get 'demo' => 'demo#index'
  get 'react' => 'react#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
