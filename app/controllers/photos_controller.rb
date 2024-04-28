class PhotosController < ActionController::Base

  def index
    render({ :template => "/photo_templates/index" })
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => photo_id }).first
    render({ :template => "/photo_templates/show" })
  end

  def create
    p = Photo.new
    p.image = params.fetch("input_image")
    p.caption = params.fetch("input_caption")
    owner = User.where({ :id => params.fetch("input_owner_id")}).first
    p.owner_id = params.fetch("input_owner_id")
    p.save
    redirect_to("/photos/#{p.id}")
  end

  def update
    photo_id = params.fetch("id")
    photo = Photo.where({ :id => photo_id }).first
    photo.image = params.fetch("input_image")
    photo.caption = params.fetch("input_caption")
    photo.save
    redirect_to("/photos/#{photo_id}")
  end

  def destroy
    photo_id = params.fetch("id")
    photo = Photo.where({ :id => photo_id }).first
    photo.destroy
    redirect_to("/photos")
  end

  def add_comment
    c = Comment.new

    photo_id = params.fetch("input_photo_id")
    c.photo_id = photo_id

    author_id = params.fetch("input_author_id")
    c.author_id = author_id

    comment = params.fetch("input_comment")
    c.body = comment

    c.save

    redirect_to("/photos/#{photo_id}")
  end

end
