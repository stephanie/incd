class IdeasController < ApplicationController
  layout "ideas_with_sidebar"

  before_action :current_user
  before_action :is_authenticated?
  before_action :set_ideas_for_sidebar
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

# GET ideas_url
  def index
  end

  # GET new_idea_url
  def new
    @idea = Idea.new
    @idea.build_description
    @idea.build_problem
    @idea.build_solution
    @idea.build_market
    @idea.build_competition
    @idea.build_demand
  end

  # POST ideas_url
  def create
    @idea = Idea.create(idea_params)
    @idea.user = @current_user

    if @idea.save
      redirect_to idea_path(@idea)
    end

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

    if params[:category_type] == 'description'
      @idea.build_description(content: params[:content])
    elsif params[:category_type] == 'problem'
      @idea.build_problem(content: params[:content])
    elsif params[:category_type] == 'solution'
      @idea.build_solution(content: params[:content])
    elsif params[:category_type] == 'market'
      @idea.build_market(content: params[:content])
    elsif params[:category_type] == 'competition'
      @idea.build_competition(content: params[:content])
    elsif params[:category_type] == 'demand'
      @idea.build_demand(content: params[:content])

    @idea.save

    if params.include?(:category_type)

    params[:content]
    params[:category_type]

    @idea = current_user.idea.find(params[:id])

    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea is updated.'
    end

    render json: {
      content: 
    }

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
      :name, :description_attributes => [:id, :content], :problem_attributes => [:id, :content], :solution_attributes => [:id, :content], :market_attributes => [:id, :content], :competition_attributes => [:id, :content], :demand_attributes => [:id, :content]
    )
  end

  def set_ideas_for_sidebar
    @current_user_ideas = current_user.ideas
  end

end