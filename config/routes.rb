Wifiplatform::Application.routes.draw do
  root :to=>"about#main"
  match "login"=>"info#marketing",  :as=>"login"
  match "submit_login_form" => "user#login"
  get "/about/showdata" => "about#showdata"
  get "/week/data" => "weeks#data" 
  get "/test" => "portal#show", :as => "portal_other" 
  get "/:member_mac/main" => "portal#main"
  get "/create_course" => "courses#new", :as=>"create_course"
  get "/logout"=>"user#logout", :as=>"logout"
  post "/course" => "courses#create"
  get "/course" => "courses#index", :as => "course_index" 
  get "/:member_name/:course_name/edit" => "courses#edit" , :as => "edit_course"
  delete "/:member_name/:course_name" => "courses#destroy"
  match '/update_poster/:course_id' => 'courses#update_poster', :as => :update_poster
  put '/course' => 'courses#update'



end
