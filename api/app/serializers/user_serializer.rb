class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :icon, :uid
  has_many :answers
end
