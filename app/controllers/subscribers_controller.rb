class  SubscribersController < ApplicationController

  def new
    @subscriber = Subscriber.new
    # @disable_nav = true
  end

  def create
    @subscriber = Subscriber.create(subscriber_params)

    redirect_to root_url
  end

  private
    
    def subscriber_params
      params.require(:subscriber).permit(
        :email
      )
    end

  end
