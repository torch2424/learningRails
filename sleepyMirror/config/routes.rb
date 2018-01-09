Rails.application.routes.draw do
  get "status" => "status#index"
  get "status/:status" => "status#status"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
