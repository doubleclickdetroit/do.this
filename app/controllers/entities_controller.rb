class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.story_id = params[:story_id]

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entity }
      else
        format.html { render action: 'new' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entity_params
    params.require(:entity).permit(:title, :note, :time, :date, :story_id)
  end

  # # GET /entities
  # # GET /entities.json
  # def index
  #   @entities = Entity.all
  # end

  # # GET /entities/new
  # def new
  #   @entity = Entity.new
  # end

  # # GET /entities/1/edit
  # def edit
  # end
end
