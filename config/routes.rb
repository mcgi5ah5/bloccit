Rails.application.routes.draw do

  get 'comments/new'

 devise_for :users
 resources :users, only: [:update]
 resources :posts
 resources :topics do
   resources :posts, except: [:index] do
   resources :comments, only: [:create]
 end
end

  get 'about' => 'welcome#about'

  root to:'welcome#index'

end
