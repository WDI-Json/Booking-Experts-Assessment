# invoice_controller.rb
class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.find(params[:booking_id])
    @invoice = Invoice.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @invoice = Invoice.new(invoice_params)
    @invoice.booking = @booking
    @invoice.user = current_user

    if @invoice.save
      redirect_to @booking, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  private

  def invoice_params
    # Define strong parameters here if needed
    params.require(:invoice).permit(:invoice_number, :amount, :due_date)
  end
end
