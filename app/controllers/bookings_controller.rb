class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /bookings or /bookings.json
  def index
    @bookings = current_user.bookings
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_user.bookings.build
    @partners = Partner.all
  end

  # GET /bookings/1/edit
  def edit
    @partners = Partner.all
  end

  # POST /bookings or /bookings.json
  def create
    @booking = current_user.bookings.build(booking_params)
    partner = Partner.find(booking_params[:partner_id])
    @accommodation = partner.accommodations.first if partner.accommodations.any?

    @booking.accommodation_id = @accommodation.id if @accommodation

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      @partners = Partner.all
      render :new
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      @partners = Partner.all
      render :edit
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  def get_invoice
    @booking = Booking.find(params[:booking_id])
    
    CreatePdfJob.perform_async(@booking.id)

    # TODO: make it work that the user receives notification that the invoice is ready. Currently 2 inv
    respond_to do |format|
      format.html { redirect_to booking_path(@booking), notice: 'Invoice PDF is being generated. You will be notified when it is ready.' }
      format.json { render json: { message: 'Invoice PDF is being generated. You will be notified when it is ready.' }, status: :accepted }
    end
  end

  private
    def set_booking
      @booking = current_user.bookings.find(params[:id])
    end
  
    def booking_params
      params.require(:booking).permit(:date_of_stay, :amount_of_days, :partner_id)
    end
end
