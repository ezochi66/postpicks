Rails.application.routes.draw do
  get 'pages/info'
  get "pages/help" => "pages#help"

  resources :groups
  resources :picks
  # root to: redirect('/picks')
  root to: 'picks#index'
  get 'search', to: 'picks#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
