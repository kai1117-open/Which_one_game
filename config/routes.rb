Rails.application.routes.draw do


    namespace :admin do
      # admin/home
      get 'home/index', to: 'home#index'
  
      # admin/users
      resources :users, only: [:index, :show, :edit, :update, :destroy]
  
      # admin/quizs
      resources :quizs, only: [:index, :show, :edit, :update, :destroy]
  
      # admin/quiz_rooms
      resources :quiz_rooms, only: [:index, :show, :edit, :update, :destroy]
  
      # admin/genre
      resources :genre
    end


  namespace :public do
    # RoomAssociation関連
    resources :room_association, only: [:create, :destroy]
  
    # QuizRooms関連
    resources :quiz_rooms, only: [:destroy] do
      collection do
        get 'top'
        get 'join'
        get 'make'
        post 'create'
        get 'room'
        get 'quiz_select'
        get 'quiz_set'
        get 'develop_select'
        get 'develop_set'
      end

      member do
        post 'start_game' # ✅ IDを必須にする
        patch :update_selected_choice
      end

    end
  
    # Quizs関連
    resources :quizs, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
    # Follows関連
    resources :follows, only: [:create, :destroy]
  
    # Users関連
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
