Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_completions, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: %i[create]

  resources :badges, only: %i[index]

  resources :feedbacks, only: %i[new create]

  namespace :admin do
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: %i[index]
  end
end
