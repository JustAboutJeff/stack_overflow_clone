class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @questions = Tag.find_by_tag_name(@tag.tag_name).questions
    render 'questions/index'
  end

  def index
    @tags = Tag.order("created_at DESC")
  end

end
