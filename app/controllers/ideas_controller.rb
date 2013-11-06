class IdeasController < ApplicationController
  
  # GET ideas_url
    def index
      @ideas = Idea.all.entries
    end

    # GET new_idea_url
    def new
      @idea = Idea.new
    end

    # POST ideas_url
    def create
      idea = Idea.create(idea_params)

      redirect_to idea_path(idea)
    end

    # GET idea_url(:id)
    def show
      @idea = Idea.find_by(id: params[:id])
      
    end

    # GET edit_idea_url(:id => 1)
    def edit
      @idea = Idea.find_by(id: params[:id])
    end

    # PUT idea_url(:id => 1)
    def update

    end

    # DELETE idea_url(:id => 1)
    def destroy
      @idea = Idea.find_by(id: params[:id])
      @idea.destroy

      redirect_to ideas_path
    end

  private

  def idea_params
    params.require(:idea).permit(
      :name
      )
  end

end