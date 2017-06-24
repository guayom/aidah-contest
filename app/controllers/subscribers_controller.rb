class SubscribersController < ApplicationController

  def new
    @subscriber = Subscriber.new
    @logo = Setting.first.logo
    @imagen = Setting.first.image
  end

  def dancer
    @subscriber = Subscriber.new
    @logo = Setting.first.logo
    @imagen = Setting.first.image
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      redirect_to page_path('thank-you'), notice: 'Subscriber was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_params
      params.require(:subscriber).permit(:email, :name, :tel, :category, :country, :terms_of_service)
    end
end
