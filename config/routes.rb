Rails.application.routes.draw do
  root 'rpg#index'
  post '/process' => 'rpg#enter'
  post '/reset' => 'rpg#reset'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
