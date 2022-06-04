Rails.application.routes.draw do
  devise_for :users
  resources :questions, shallow: true do
    resources :answers, except: [:show, :index]
  end

  root to: 'questions#index'
end
