class TagsController < ApplicationController
  def index
    tags = Tag.all
    render json: tags.as_json
  end

  def create
    tag = Tag.new(
      name: params[:name]
    )
    tag.save
    render json: tag.as_json
  end

  def show
    tag = Tag.find_by(id: params[:id])
    render json: tag.as_json
  end

  def update
    tag = Tag.find_by(id: params[:id])
    tag.update(
      name: params[:name] || tag.name
    )
    render as_json: {message: "Update successful"}
  end

  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.destroy
    render as_json: {message: "Tag successfully destroyed"}
  end
end
