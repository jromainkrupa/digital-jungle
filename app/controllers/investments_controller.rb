class InvestmentsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  
  def index
    @investments = policy_scope(Investment.where(user_id: current_user))
  end

  def new
    @investment = @project.investments.new(user_id: current_user.id)
    authorize @investment
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.project = @project
    @investment.user = current_user
    authorize @investment
    if @investment.save
      redirect_to investments_path, notice: "Investment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
