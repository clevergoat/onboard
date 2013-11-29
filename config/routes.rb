Onboard::Application.routes.draw do

  get "submissions/new"
  get "submissions/show"
  # to fit in with omniauth's callback urls
  get "/auth/:provider/callback" => "social_logins#create"

  # static pages
  get "/about" => "contents#about"
  get "/terms-and-conditions" => "contents#terms", as: "terms"
  get "/privacy" => "contents#privacy"

  # this is where our URLs of our webapp are set
  resources :users
  resources :jobs do
    resources :submissions
  end


  # because i don't want to login twice as a user
  # lets use a singular resource
  resource :session

  root "jobs#index"

end
