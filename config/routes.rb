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
			post 'approve_join_request'
			get 'join_requests'
			delete 'decline_join_request'
		end

	end
end
