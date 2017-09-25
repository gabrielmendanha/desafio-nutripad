Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :numeros, only: [:show] do

  end

  get '*unmatched_route', to: 'numeros#not_found'

end
