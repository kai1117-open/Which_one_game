Rails.application.routes.draw do

  root "home#index" # トップページ用
  devise_for :users

  resources :users, only: [:show, :index] # マイページとユーザー検索用
end
