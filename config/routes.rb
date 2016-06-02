Rails.application.routes.draw do

  get 'lists/index'

  get 'lists/show'

  get 'lists/edit'

  get 'list/index'

  get 'list/show'

  get 'list/edit'

  devise_for :users
  root 'home#index'

  resources :buckets

end
