class PeopleController < ApplicationController
  before_action :set_entity_user, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  def create
    @entity_user = EntityUser.new entity_id: params[:entity_id], user_id: params[:user_id]

    respond_to do |format|
      if @entity_user.save
        # format.html { redirect_to @entity_user, notice: 'Relationship was successfully created.' }
        # format.json { render action: 'show', status: :created }
        format.json { head :created }
      else
        # format.html { render action: 'new' }
        format.json { render json: @entity_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity_user.destroy
    respond_to do |format|
      # format.html { redirect_to entity_url(@entity_user.entity) }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_entity_user
    @entity_user = EntityUser.where(entity_id: params[:entity_id], user_id: params[:user_id]).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entity_user_params
    params.require(:entity_user).permit(:user_id)
  end
end
