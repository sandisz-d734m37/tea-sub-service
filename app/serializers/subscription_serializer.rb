class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency, :tea_name, :user
end
