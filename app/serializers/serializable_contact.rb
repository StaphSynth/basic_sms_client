class SerializableContact < JSONAPI::Serializable::Resource
  attributes :id, :user_id, :phone_number
end
