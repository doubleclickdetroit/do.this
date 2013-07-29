App::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :entities, only: [:create, :show, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
    resources :people, only: [:create, :destroy], param: :user_id
    # resources :tags, only: [:create, :destroy], param: :name
    post   'tags/:name' => 'tags#create',  as: :tag
    delete 'tags/:name' => 'tags#destroy', as: :tags
  end

  resources :stories, only: [:create, :show, :update, :destroy] do
    resources :entities, only: [:create, :show, :update, :destroy]
    # resources :tags, only: [:create, :destroy], param: :name
    post   'tags/:name' => 'tags#create',  as: :tag
    delete 'tags/:name' => 'tags#destroy', as: :tags
  end

  scope :timeline do
    get '/'                 => 'timeline#me',      as: :timeline
    get 'stories'           => 'timeline#stories', as: :timeline_stories
    get 'tag/:name'         => 'timeline#tag',     as: :timeline_tag
    get 'person/:person_id' => 'timeline#person',  as: :timeline_person
  end
end
