Rails.application.routes.draw do
 
  # Homepage
  get("/", { :controller => "users", :action => "home" })

  # Users
  get("/users", { :controller => "users", :action => "index" })
  post("/add_user", { :controller => "users", :action => "create" })
  get("/users/:username", { :controller => "users", :action => "show" })
  post("/update_user/:username", { :controller => "users", :action => "update" })

  # Photos
  get("/photos", { :controller => "photos", :action => "index" })
  post("insert_photo_record", { :controller => "photos", :action => "create" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show" })
  post("/update_photo/:id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })
  post("/add_comment", { :controller => "photos", :action => "add_comment" })

end
