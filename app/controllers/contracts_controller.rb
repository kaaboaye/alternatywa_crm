class ContractsController < ApplicationController
  def index
    @member = Member.find params[:member_id]
  end

  def new
    @contract = Contract.new
    @contract.member = Member.find params[:member_id]
  end

  def create
    @contract = Contract.new contract_params
    @contract.member = Member.find params[:member_id]

    if @contract.save
      redirect_to member_contract_path(@contract.member, @contract)
    else
      render 'new'
    end
  end

  def show
    @contract = Contract.find params[:id]
  end

  def edit
    @contract = Contract.find params[:id]
  end

  def update
    @contract = Contract.find params[:id]

    if @contract.update contract_params
      redirect_to member_recommendation_path(@contract.member, @contract)
    else
      render 'show'
    end
  end

  def destroy
    contract = Contract.find params[:id]
    contract.destroy

    case params[:ref]
    when "members-show"
      redirect_to member_path(contract.member)
    else
      redirect_to member_contracts_path(contract.member)
    end
  end

private
  def contract_params
    params.require(:contract).permit :since, :finish, :number, :description
  end
end
