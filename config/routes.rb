Rails.application.routes.draw do
  get 'todos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/todos", to: "todos#index"
  # post "/todos" to: "todos#create"
  # resources :todos, only: [:index, :create, :createTodo]
  # resources :lists, only: [:index]
  scope 'api' do
    resources :lists do
      resources :todos, shallow: true
    end
  end
end

