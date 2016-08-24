Rails.application.routes.draw do
  resources :textzones
  get 'textzones/:lang/:id_page', to: 'textzones#yolo'
  post 'textzones/update', to: 'textzones#yolopatch'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
