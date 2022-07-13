Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :bug_reports
  end
end
