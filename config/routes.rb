  resources :pessoas, only: [:index, :show, :create] do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root 'pessoas#index'

  get 'contagem-pessoas', to: 'pessoas#contagem'
end
