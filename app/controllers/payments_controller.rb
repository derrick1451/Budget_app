class PaymentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @group = Group.find(params[:group_id])
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.payments.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.payments.new(expense_params)
    @expense.author = current_user

    if @expense.save
      @group.payments << @expense
      redirect_to group_payments_path(@group), notice: 'Transaction was successfully created.'
    else
      flash[:alert] = 'Transaction could not be created.'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
