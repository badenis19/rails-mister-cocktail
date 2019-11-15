Rails.application.routes.draw do
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # to have access to the cocktails ID on which I will associate my dose
  resources :cocktails, only: [:index, :new, :show, :edit, :create] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:new, :destroy]

  root to: "cocktails#index"

end



