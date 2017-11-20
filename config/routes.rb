Rails.application.routes.draw do
  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Food_category resource:
  # CREATE
  get "/food_categories/new", :controller => "food_categories", :action => "new"
  post "/create_food_category", :controller => "food_categories", :action => "create"

  # READ
  get "/food_categories", :controller => "food_categories", :action => "index"
  get "/food_categories/:id", :controller => "food_categories", :action => "show"

  # UPDATE
  get "/food_categories/:id/edit", :controller => "food_categories", :action => "edit"
  post "/update_food_category/:id", :controller => "food_categories", :action => "update"

  # DELETE
  get "/delete_food_category/:id", :controller => "food_categories", :action => "destroy"
  #------------------------------

  # Routes for the Dish resource:
  # CREATE
  get "/dishes/new", :controller => "dishes", :action => "new"
  post "/create_dish", :controller => "dishes", :action => "create"

  # READ
  get "/dishes", :controller => "dishes", :action => "index"
  get "/dishes/:id", :controller => "dishes", :action => "show"

  # UPDATE
  get "/dishes/:id/edit", :controller => "dishes", :action => "edit"
  post "/update_dish/:id", :controller => "dishes", :action => "update"

  # DELETE
  get "/delete_dish/:id", :controller => "dishes", :action => "destroy"
  #------------------------------

  # Routes for the Venue resource:
  # CREATE
  get "/venues/new", :controller => "venues", :action => "new"
  post "/create_venue", :controller => "venues", :action => "create"

  # READ
  get "/venues", :controller => "venues", :action => "index"
  get "/venues/:id", :controller => "venues", :action => "show"

  # UPDATE
  get "/venues/:id/edit", :controller => "venues", :action => "edit"
  post "/update_venue/:id", :controller => "venues", :action => "update"

  # DELETE
  get "/delete_venue/:id", :controller => "venues", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Dish_detail resource:
  # CREATE
  get "/dish_details/new", :controller => "dish_details", :action => "new"
  post "/create_dish_detail", :controller => "dish_details", :action => "create"

  # READ
  get "/dish_details", :controller => "dish_details", :action => "index"
  get "/dish_details/:id", :controller => "dish_details", :action => "show"

  # UPDATE
  get "/dish_details/:id/edit", :controller => "dish_details", :action => "edit"
  post "/update_dish_detail/:id", :controller => "dish_details", :action => "update"

  # DELETE
  get "/delete_dish_detail/:id", :controller => "dish_details", :action => "destroy"
  #------------------------------

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
