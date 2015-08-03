Rails.application.routes.draw do

 devise_for :users
 resources :posts
 resources :topics do
   resources :posts, except: [:index]
 end
 resources :summaries

  get 'about' => 'welcome#about'

  root to:'welcome#index'

end