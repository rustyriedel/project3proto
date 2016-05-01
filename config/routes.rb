Rails.application.routes.draw do
 
  resources :folders
  resources :documents
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'
  
  

  root                'statics_pages#home'
  get    'help'    => 'statics_pages#help'
  get    'about'   => 'statics_pages#about'
  get    'contact' => 'statics_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'folders/:folder_id' => 'folders#browse'
  get    'folders/:folder_id/new' => 'folders#new', :as => 'new_sub_folder' 
  get    'folders/:folder_id/new_document' => 'documents#new', :as => 'new_sub_document'
  
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
