App::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :entities, only: [:create, :update, :destroy] do
    resources :tags, only: [:create, :destroy]
  end

  scope :timeline do
    get '/'                 => 'timeline#me',      as: :timeline
    get 'stories'           => 'timeline#stories', as: :timeline_stories
    get 'tag/:id'           => 'tags#show',        as: :timeline_tag
    get 'person/:person_id' => 'timeline#person',  as: :timeline_person
  end
end
