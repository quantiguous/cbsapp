class CustomerAccountsController < ApplicationController
  respond_to :json, :xml

  def find_account
    account = CustomerAccount.find_by_account_number(params[:account_number])
    head :status => :not_found and return unless account
    respond_with(account) do |format|
      format.xml { render :xml => account.to_xml}
      format.json { render :json => account}
    end
  end

  def show
    account = CustomerAccount.find_by_account_number(params[:id])
    head :status => :not_found and return unless account
    respond_with account
  end
end