class SubscribersController < ApplicationController

  def new
    @subscriber = Subscriber.new
  end

  def dancer
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      WelcomeMailer.welcome_email(@subscriber).deliver
      redirect_to "/thank-you", notice: I18n.t('notifications.successfuly_suscribed')
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
