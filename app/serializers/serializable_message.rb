class SerializableMessage < JSONAPI::Serializable::Resource
  attributes :id, :user_id, :contact_id, :text, :replies
end
