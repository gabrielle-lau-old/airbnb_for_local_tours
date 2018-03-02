Rails.application.routes.draw do
  # Routes for the Local_event resource:
  # CREATE
  get "/local_events/new", :controller => "local_events", :action => "new"
  post "/create_local_event", :controller => "local_events", :action => "create"

  # READ
  get "/local_events", :controller => "local_events", :action => "index"
  get "/local_events/:id", :controller => "local_events", :action => "show"

  # UPDATE
  get "/local_events/:id/edit", :controller => "local_events", :action => "edit"
  post "/update_local_event/:id", :controller => "local_events", :action => "update"

  # DELETE
  get "/delete_local_event/:id", :controller => "local_events", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
