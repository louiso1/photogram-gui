class UsersController < ActionController::Base
  
  def home
    redirect_to("/users")
  end

  def index
    render({ :template => "user_templates/index" })
  end

  def create
    user = User.new
    username = params.fetch("input_username")
    user.username = username
    user.save
    redirect_to("/users/#{username}")
  end

  def show
    username = params.fetch(:username)
    @user = User.where({ :username => username }).first
    render({ :template => "user_templates/show"})
  end

  def update
    username = params.fetch("username")
    user = User.where({ :username => username }).first
    new_username = params.fetch("input_username")
    user.username = new_username
    user.save
    redirect_to("/users/#{new_username}")
  end

end
