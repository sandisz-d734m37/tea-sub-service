class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :shipping_address, :subscriptions
end
