PredsTix::Application.routes.draw do
  resources :tickets, :except => [:destroy]
  resources :games, :except => [:destroy]
  resources :ticket_holders, :except => [:destroy]
  resources :seasons, :except => [:destroy]

  root :to => 'games#index'
end
