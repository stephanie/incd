class IdeasController < ApplicationController
  layout "ideas_with_sidebar"

  before_action :is_authenticated?
  before_action :set_ideas_for_sidebar
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

# GET ideas_url
  def index
  end

  # GET new_idea_url
  def new
    @idea = Idea.new
    # @problem = @idea.problem.build
    # @solution = @idea.solution.build
    # @market = @idea.market.build
    # @competition = @idea.competition.build
    # @problem = @idea.problem.build
  end

  # POST ideas_url
  def create
    @idea = Idea.create(idea_params)
    # @problem = Problem.create(params.permit(:username))
    # @solution = Solution.create(params.permit(:username))
    # @market = Market.create(params.permit(:username))
    # @competition = Competition.create(params.permit(:username))
    # @demand = Demand.create(params.permit(:username))

    redirect_to idea_path(idea)

  end

  # GET idea_url(:id)
  def show
    @idea = Idea.find_by(id: params[:id])
    @description = @idea.description
    @problem = @idea.problem
    @solution = @idea.solution
    @market = @idea.market
    @competition = @idea.competition
    @demand = @idea.demand

  end

  # GET edit_idea_url(:id => 1)
  def edit
    @idea = Idea.find_by(id: params[:id])
  end

  # PUT idea_url(:id => 1)
  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea is updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE idea_url(:id => 1)
  def destroy
    @idea = Idea.find_by(id: params[:id])
    @idea.destroy

    redirect_to idea_path, notice: 'Idea is deleted.'
  end

private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(
      :name
      )
  end

  def set_ideas_for_sidebar
    @current_user_ideas = current_user.ideas
  end

end