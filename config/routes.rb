Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/, defaults: { locale: :en } do
    root to: 'ads#index'
    devise_for :users, controllers: { sessions: 'users/sessions' }

    get 'dashboard', to: 'dashboard#index'
    get 'dashboard/ads', to: 'dashboard#ads'
    get 'dashboard/adver_types', to: 'dashboard#adver_types'
    get 'dashboard/review_ads', to: 'dashboard#review_ads'

    resources :ads, as: :advertisements do
      post 'change_status'
    end
    resources :adver_types
  end

  # match '*path' => redirect('/'), via: :all
end
