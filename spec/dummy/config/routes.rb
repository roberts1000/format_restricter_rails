Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
