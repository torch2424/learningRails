Rails.application.routes.draw do
  get "status" => "status#index"
  post "status" => "status#index"
  put "status" => "status#index"
  delete "status" => "status#index"


  get "status/:status" => "status#status"
  post "status/:status" => "status#status"
  put "status/:status" => "status#status"
  delete"status/:status" => "status#status"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
