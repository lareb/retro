Pathshala::Application.routes.draw do
  get "dashboard/index"

  get "home/index"

  #devise_for :users
  devise_for :users, :controllers => { :sessions => "sessions" }, :path => "/", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  #devise_for :users, :controllers => { :sessions => "sessions" }, :path => "auth", :path_names => { :sign_in => 'login',:confirmation => 'confirmation'}
  resources :users
  resources :students

  resources :subjects
  resources :teachers do
    member do
      get "klasses"
    end
    resources :users
    resources :teacher_subjects, :path => 'subjects'
  end

  resources :klasses do
    resources :fee_structures, :path => "fees"
    #resources :klass_fees, :path => "fees"    
    resources :teacher_klasses, :path => "teachers"
    resources :sections do
      resources :students
      resources :teacher_sections, :path => "teachers"
    end
  end
  resources :courses do
    resources :course_fees, :path => "fees"
    resources :course_timings, :path => "timings"
  end
  resources :admissions do
    collection do
      get "review"
    end
    member do
      get "review", :to => "admissions#student_review"
    end
    resources :admission_documents, :path => 'documents'
  end
  resources :roles, :only => [:index]
  resources :dashboard, :only => [:index]
  resources :documents
  resources :fees

  #match 'teachers/:id' => 'teacher#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
