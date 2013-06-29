BaobabLogic::Application.routes.draw do
 	get "/blog" => "blogs#index"

  resources :blogs
  resources :projects
  resources :users

	root :to => 'pages#home'
end
