Rails.application.routes.draw do
  # Routes for the Venues_detail resource:
  # CREATE
  get "/venues_details/new", :controller => "venues_details", :action => "new"
  post "/create_venues_detail", :controller => "venues_details", :action => "create"

  # READ
  get "/venues_details", :controller => "venues_details", :action => "index"
  get "/venues_details/:id", :controller => "venues_details", :action => "show"

  # UPDATE
  get "/venues_details/:id/edit", :controller => "venues_details", :action => "edit"
  post "/update_venues_detail/:id", :controller => "venues_details", :action => "update"

  # DELETE
  get "/delete_venues_detail/:id", :controller => "venues_details", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
