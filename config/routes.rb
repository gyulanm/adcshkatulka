Rails.application.routes.draw do

    get 'posts/search', to: 'posts#search'

    post 'support/request_support'

    resources :posts do
        collection do
            get "by_tag/:tag", to: "posts#by_tag", as: "tagged"
        end
    end

    resources :idea_posts do
        collection do
          get "by_tag/:tag", to: "idea_posts#by_tag", as: "tagged"
        end
    end

    resources :comments, only: [:create]

    namespace :api do
        namespace :v1 do
          resources :comments
          resources :posts

          devise_scope :user do
            post "sign_up", to: "registrations#create"
            post "sign_in", to: "sessions#create"
            post "sign_out", to: "sessions#destroy"
          end
        end
    end


    resources :posts, param: :slug do
        resource :favorite, only: [:create, :destroy]
    end

    devise_for :users

    get 'welcome/support'
    root "pages#trends"

    get 'search', to: 'pages#search'
    get 'stones', to: 'pages#stones'

    get 'history', to: 'pages#history'
    get 'jewelrystory', to: 'pages#jewelrystory'

    get 'cartier', to: 'pages#cartier'
    get 'trends', to: 'pages#trends'
    get 'zircon', to: 'pages#zircon'


    get 'lk', to: 'pages#lk'

     post 'support/request_support'

   resources :users
end
