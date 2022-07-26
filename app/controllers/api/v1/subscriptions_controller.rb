class Api::V1::SubscriptionsController < ApplicationController
  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  def create
    user = User.find(params[:user_id])
    subscription = user.subscriptions.create!(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_name)
  end
end
