Rails.application.routes.draw do
  devise_for :users
  resources :tv_shows do
    resources :episodes
    resources :actors, only: [:new, :create]
  end

  root 'tv_shows#index'
end
