class ImagesController < ApplicationController
  before_action :authenticate_user
  def index
    @images = Image.all
    render template: "images/index"
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image_url], resource_type: :auto)
    p response
    cloudinary_url = response["secure_url"]
    cloudinary_height = response["height"]
    cloudinary_width = response["width"]

    @image = Image.new(
      user_id: current_user.id,
      image_url: cloudinary_url,
      name: params[:name],
      description: params[:description],
      height: cloudinary_height,
      width: cloudinary_width
    )
    @image.save
    tags = params[:tags].split(/\s*,\s*/)
    index = 0
    while index < tags.length
      new_tag = Tag.new(
        name: tags[index]
      )
      new_tag.save
      ImageTag.create(
        image_id: @image.id,
        tag_id: new_tag.id
      )
      index += 1
    end
    render template: "images/show"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render template: "images/show"
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.update(
      name: params[:name] || @image.name,
      description: params[:description] || @image.description
    )
    render template: "images/show"
  end

  def destroy
    image = Image.find_by(id: params[:id])
    # index = 0
    # while index < ImageTag.all.length
    #   if image.id == ImageTag.all[index].image_id
    #     ImageTag.all[index].destroy
    #   end
    #   index += 1
    # end
    image.destroy
    render json: {message: "Image successfully destroyed"}
  end
end
