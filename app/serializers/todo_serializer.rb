class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :is_completed
end
