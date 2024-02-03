Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end

# ユーザー用
# URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
# 管理者用
# URL /admin/sign_in ...
  devise_for :admins, controllers: {
  sessions: "admin/sessions"
  }
  
  
  namespace :admin do
    root to: "homes#top"
  end
  
  scope module: :user do
    root to: "homes#top"
  end
end
