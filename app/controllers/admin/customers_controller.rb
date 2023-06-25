class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer =  Customer.find(params[:id])
    customer.update(customer_params)

    if params[:customer][:status] == "1"
      customer.update(is_deleted: true)
      flash[:notice] = "退会処理を実行いたしました"

    elsif params[:customer][:status] == "0"
      customer.update(is_deleted: false)
    end

    redirect_to admin_customer_path(customer.id)
  end

  def customer_params
    params.require(:customer).permit(:email,:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
