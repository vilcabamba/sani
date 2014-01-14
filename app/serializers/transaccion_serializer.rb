class TransaccionSerializer < ActiveModel::Serializer
  attributes :id,
             :model,
             :action,
             :attrs
end
