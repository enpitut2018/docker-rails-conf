Rails.application.routes.draw do
  root 'pairings#index'

  get 'pairings/index'
  post 'pairings/index'
  get 'pairings/save'
  get 'pairings/show/:id', to: 'pairings#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
