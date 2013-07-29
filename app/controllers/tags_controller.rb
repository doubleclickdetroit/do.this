class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def create
    @tag      = parent.tags.build(name: params[:name])
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

private
  def parent
    klass = if id = params[:entity_id]
              Entity
            elsif id = params[:story_id]
              Story
            else
              fail "Requires parent id" # TODO
            end
    klass.find id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    # TODO performant?
    @tag = parent.tags.find_by name: params[:name]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end

  # def index
  #   @tags = Tag.all
  # end

  # def new
  #   @tag = Tag.new
  # end

  # def edit
  # end

  # def show
  # end

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
