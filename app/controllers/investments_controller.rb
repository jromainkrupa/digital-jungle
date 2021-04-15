class InvestmentsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  
  def new
    @investment = Investment.new
  end

  def create
    @investment         = Investment.new(investment_params)
    @investment.project = @project
    @investment.user    = current_user
    if @investment.save
      redirect_to project_path(@project), notice: "Investment was successfully created."
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
