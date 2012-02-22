class Article
  include Mongoid::Document
  embeds_many :comments
  field :title, localize: true
end

class Comment
  include Mongoid::Document
  embedded_in :article
  field :title, localize: true
end
