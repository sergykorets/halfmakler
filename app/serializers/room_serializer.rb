class RoomSerializer < ActiveModel::Serializer
  attributes :id, :listing_name, :address, :home_type, :summary, :price, :active, :image

  def image
    @instance_options[:image]
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :email, :fullname, :image
  end

  belongs_to :user, serializer: UserSerializer, key: :host
end