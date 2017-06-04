class Subscribers::BuildController < ApplicationController
  include Wicked::Wizard

  steps :add_email, :add_name, :add_tel, :add_category, :add_countrys

  def new
    @subscriber = Subscriber.new
    render_wizard
  end

  def update
    @subscriber = Subscriber.find(params[:subscriber_id])
    params[:subscriber][:status] = step.to_s
    params[:subscriber][:status] = 'active' if step == steps.last
    @subscriber.assign_attributes(params[:subscriber])
    render_wizard @subscriber
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.create
      redirect_to wizard_path(steps.first, :product_id => @subscriber.id)
    else
      render :new
    end
  end

  def finish_wizard_path
    page_path('thank-you')
  end

end
