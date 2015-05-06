class ListSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :title, :archived

  has_many :todos
end
