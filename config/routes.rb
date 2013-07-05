BaobabLogic::Application.routes.draw do
	get "log_out" => "sessions#destroy", :as => "log_out"
  	get "log_in" => "sessions#new", :as => "log_in"
  	get "sign_up" => "users#new", :as => "sign_up"

 	get "/blogs" => "blogs#index"

  	resources :blogs, :projects, :users, :sessions

	root :to => 'pages#home'
end
