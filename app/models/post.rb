class Post < ActiveRecord::Base
  attr_accessible :subject, :body
  has_many :comments
end
