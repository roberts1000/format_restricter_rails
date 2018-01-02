Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"

  namespace :only do
    get "html_1"
    get "html_multi_2"
    get "html_multi_3"
    get "not_restricted"
  end

  namespace :all do
    get "html_1"
    get "html_2"
  end
end
