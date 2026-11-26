Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#index"

  namespace :all do
    get "html1"
    get "html2"
  end

  namespace :only do
    get "html1"
    get "html_multi2"
    get "html_multi3"
    get "not_restricted"
  end

  namespace :except do
    get "html1"
    get "html2"
    get "json_xml"
    get "no_allowed_formats"
  end
end
