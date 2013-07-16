class TimelineController < ApplicationController
  def me
    @items = Entity.where user: current_user
  end

  def tag
  end

  def person
  end

  def stories
  end
end
