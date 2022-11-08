class ImagesController < ApplicationController
  before_action :authenticate_user
  def index
    images = Image.all
    render json: images.as_json
  end

  def create
    authenticate_user
    image = Image.new(
      user_id: current_user.id,
      image_url: params[:image_url],
      name: params[:name],
      description: params[:description]
    )
    image.save
    tags = params[:tags]
    index = 0
    while index < tags.length
      new_tag = Tag.new(
        name: tags[index]
      )
      new_tag.save
      ImageTag.create(
        image_id: image.id,
        tag_id: new_tag.id
      )
      index += 1
    end
    render json: image.as_json
  end

  def show
    image = Image.find_by(id: params[:id])
    render json: image.as_json
  end

  def update
    image = Image.find_by(id: params[:id])
    image.update(
      image_url: params[:image_url] || image.image_url,
      name: params[:name] || image.name,
      description: params[:description] || image.description
    )
    render as_json: {message: "Update successful"}
  end

  def destroy
    authenticate_user
    image = Image.find_by(id: params[:id])
    image.destroy
    render json: {message: "Image successfully destroyed"}
  end
end
