Rails.application.routes.draw do
 
  get("/", { :controller => "users", :action => "home" })

  get("/users", { :controller => "users", :action => "index" })
  post("/add_user", { :controller => "users", :action => "create" })
  get("/users/:username", { :controller => "users", :action => "show" })
  post("/update_user/:username", { :controller => "users", :action => "update" })

end
