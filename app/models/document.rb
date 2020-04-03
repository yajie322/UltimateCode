class Document < ActiveRecord::Base
  belongs_to :user
  has_many :collaboration
  has_many :user, :through => :collaboration
end
