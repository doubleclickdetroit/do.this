class TimelineController < ApplicationController
  def me
    @items = Entity.where(user: current_user).page(params[:page]).per(10)
  end

  def tag
    @tags  = Tag.includes(:taggable).where(name: params[:name], user: current_user).page(params[:page]).per(10)
    @items = @tags.map &:taggable
  end

  def person
  end

  def stories
  end
end
