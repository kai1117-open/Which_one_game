Rails.application.routes.draw do

  namespace :public do
    resources :users, only: [:index, :show, :edit, :update] do
      post 'withdraw', on: :member
      collection do
        get 'search'  # 検索用ルート
      end
    end
  end





  root "home#index" # トップページ用
# 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'

}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
