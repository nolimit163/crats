Rails.application.routes.draw do
  # Add your extension routes here
	root :to => 'home#index'
	match '/admin/store_details'=>'admin/store_details#index'
	match '/admin/store_details/billing_history'=>'admin/store_details#billing_history'
	match '/admin/store_details/store_billing'=>'admin/store_details#store_billing'
	match '/admin/owners'=>'admin/users#index',:as =>:admin_store_owners
	match 'store/:id' => 'stores_registration#new_store'
	match 'store' => 'stores_registration#save_store_details'
	match '/storeowner' => 'stores_registration#storeowner',:as=>:storeowner
	match 'user_update_plan/:plan_id'=>'admin/upgrade_plans#user_update_plan',:as=>:update_plan
	match 'admin/store_registration_payment_method'=>'admin/payment_methods#store_registration_payment_method',:as=>:store_registration_payment_method
	match '/admin/users/store_status'=>'admin/users#store_owners'
  match '/static_pages/aboutus' => 'static_pages#aboutus'
  match '/static_pages/contactus' => 'static_pages#contactus'
  match '/static_pages/privacy' => 'static_pages#privacy'
  match '/static_pages/terms' => 'static_pages#terms'
	namespace :admin do
		resources :pricing_plans
		resources :domain_customizes
		resources :upgrade_plans
	end
	resources :stores_registration
end
