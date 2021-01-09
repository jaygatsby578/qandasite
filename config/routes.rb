Rails.application.routes.draw do
  resources :comments
  resources :articles
  resources :answers
  resources :questions
  get 'moneys/index'
  get 'moneys', to: 'moneys#index'

  get 'moneys/add'
  post 'moneys/add'

  get 'moneys/edit/:id', to: 'moneys#edit'
  patch 'moneys/edit/:id', to: 'moneys#edit'

  get 'moneys/delete/:id', to: 'moneys#delete'

  get 'question/index'
  get 'question', to: 'question#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
