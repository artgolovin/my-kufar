Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/, defaults: { locale: :en } do
    root to: 'ads#index'
    devise_for :users, controllers: { sessions: 'users/sessions' }
    get 'dashboard', to: 'dashboard#index'
    get 'dashboard/ads', to: 'dashboard#ads'
    get 'dashboard/adver_types', to: 'dashboard#adver_types'
    resources :ads, as: :advertisements
    resources :adver_types
  end

  # match '*path' => redirect('/'), via: :all
end
