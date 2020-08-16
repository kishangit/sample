Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'welcome/book'
  post 'welcome/cancel'
  post 'welcome/cancel_by_doctor'
  post 'welcome/accept_by_doctor'

  root to: "welcome#index"
	# Rails.application.routes.draw do
	#   devise_for :users, controllers: {
	#     sessions: 'users/sessions'
	#   }
	# end

end
