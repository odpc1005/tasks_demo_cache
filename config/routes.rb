Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :tasks, only: [:create] do
    resources :task_logs
    member do
      put 'done'
    end
    collection do
      get 'search'
    end
  end

  resource :comment




  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
