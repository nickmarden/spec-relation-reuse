class Comment < ActiveRecord::Base
  attr_accessible :post, :body
  belongs_to :post
end
