Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    root to: 'ads#index'
    devise_for :users, controllers: { sessions: 'users/sessions' }
    get 'dashboard', to: 'dashboard#index'
    get 'dashboard/published_ads', to: 'dashboard#published_ads'
    get 'dashboard/hidden_ads', to: 'dashboard#hidden_ads'
    resources :ads, only: %i[index show], as: :advertisements
  end

  match '*path' => redirect('/'), via: :all
end
