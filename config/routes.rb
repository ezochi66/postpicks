Rails.application.routes.draw do
  get 'helps/index'
  get 'pages/info'
  resources :groups
  resources :picks
  root to: redirect('/picks')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
