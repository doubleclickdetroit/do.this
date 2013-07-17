class TimelineController < ApplicationController
  def me
    @items = Entity.where user: current_user
  end

  def tag
    @tags  = Tag.where name: params[:name], user: current_user
    @items = @tags.map &:taggable
  end

  def person
  end

  def stories
  end
end
