class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show update destroy ]

  # GET /bank_accounts
  def index
    @bank_accounts = BankAccount.all

    render json: @bank_accounts
  end

  # GET /bank_accounts/1
  def show
    render json: @bank_account
  end

  # POST /bank_accounts
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      render json: @bank_account, status: :created, location: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  def update
    if @bank_account.update(bank_account_params)
      render json: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  def destroy
    @bank_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.require(:bank_account).permit(:bank_account_number, :bank_holder_name)
    end
end
