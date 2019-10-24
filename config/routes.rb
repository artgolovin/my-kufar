Rails.application.routes.draw do
  root "ads#index"

  match '*path' => redirect('/'), via: :all
end
