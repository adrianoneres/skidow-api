Rails.application.routes.draw do
  root 'welcome#index'



  scope '/api'do
  end
end
