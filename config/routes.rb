Rails.application.routes.draw do
	root 'home#welcome'
	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}
	resources :users do
		resources :teams, except: [:show] do
			collection do
				get 'joined'
			end
		end
	end
	resources :teams do
		collection do
			post 'join_team'
		end
		member do
			get 'join_requests'
		end
	end
end
