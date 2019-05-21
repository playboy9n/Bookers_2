Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :books
  get "/" => "books#top", as: "top"
  get "/home/about" => "books#about",as: "about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users,only: [:show, :index, :edit, :update]

end
