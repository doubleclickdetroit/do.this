class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def create
    entity    = Entity.find(params[:entity_id])
    @tag      = entity.tags.build(tag_params)
    @tag.user = current_user

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @tag }
        format.json { render action: 'show', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  # def show
  # end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end

  # # GET /tags
  # # GET /tags.json
  # def index
  #   @tags = Tag.all
  # end

  # # GET /tags/new
  # def new
  #   @tag = Tag.new
  # end

  # # GET /tags/1/edit
  # def edit
  # end

  # # PATCH/PUT /tags/1
  # # PATCH/PUT /tags/1.json
  # def update
  #   respond_to do |format|
  #     if @tag.update(tag_params)
  #       format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @tag.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
