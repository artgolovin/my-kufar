Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    root to: 'ads#index'
    resources :ads, only: %i[index show], as: :advertisements
  end

  match '*path' => redirect('/'), via: :all
end
