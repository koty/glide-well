Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :workouts
  post '/workouts/:workout_id/edit', to: 'workout_details#update'
  post '/workout_details/:workout_id/', to: 'workout_details#create'
  get '/workout_details/:workout_id/', to: 'workout_details#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
