Rails.application.routes.draw do
  namespace :api do
    post "/receiver", to: "hooks#create"
  end
end
