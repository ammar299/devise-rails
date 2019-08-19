Rails.application.routes.draw do
			root 'home#welcome'
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
end
