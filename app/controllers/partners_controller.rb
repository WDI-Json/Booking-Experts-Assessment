class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    @partners = Partner.all
  end

  def show

  end

  def new
    @partner = Partner.new
  end

  def edit
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      redirect_to @partner, notice: 'Partner was successfully created.'
    else
      render :new
    end
  end

  def update
    if @partner.update(partner_params)
      redirect_to @partner, notice: 'Partner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy!

    respond_to do |format|
      format.html { redirect_to partners_url, notice: "Partner was successfully destroyed." }
    end
  end

  private
  def set_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:name, :location)
  end
end
