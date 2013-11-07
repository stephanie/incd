class DescriptionsController < ApplicationController
  before_action :set_idea
  before_action :set_description, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @description = @idea.description.find_by(id: params[:id])

    redirect_to 'edit'
  end

  def new
    @description = @idea.description.build
  end

  def create
    @description = @idea.description.create(description_params)

    redirect_to idea_path(idea)
  end

  def update
    if @description.update(description_params)
      redirect_to idea_path(idea), notice: 'Description is updated.'
    else
      render action: 'edit'
    end
  end

  def edit
  end

  def destroy
    @description.destroy
    redirect_to idea_path(idea), notice: 'Description is deleted.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
      
  def set_description
    @description = @idea.description.find(params[:id])
  end

  def description_params
    params.require(:description).permit(:content)
  end
end
