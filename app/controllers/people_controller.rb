class PeopleController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  def create
    @relationship = new_relationship # TODO refactor

    respond_to do |format|
      if @relationship.save
        # format.html { redirect_to @relationship, notice: 'Relationship was successfully created.' }
        # format.json { render action: 'show', status: :created }
        format.json { head :created }
      else
        # format.html { render action: 'new' }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relationship.destroy
    respond_to do |format|
      # format.html { redirect_to entity_url(@relationship.entity) }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_relationship
    if id = params[:entity_id]
      @relationship = EntityUser.find_by entity_id: id, user_id: params[:user_id]
    elsif id = params[:story_id]
      @relationship = StoryUser.find_by story_id: id, user_id: params[:user_id]
    else
      fail 'Requires parent id'
    end
  end

  def new_relationship
    if id = params[:entity_id]
      EntityUser.new entity_id: id, user_id: params[:user_id]
    elsif id = params[:story_id]
      StoryUser.new story_id: id, user_id: params[:user_id]
    else
      fail 'Requires parent id'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def relationship_params
    params.require(:relationship).permit(:user_id)
  end
end
