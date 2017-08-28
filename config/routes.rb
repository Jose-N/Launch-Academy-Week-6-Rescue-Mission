Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :answers, only: [:create]
  end
end
