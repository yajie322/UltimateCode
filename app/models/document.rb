class Document < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, :through => :collaboration
end
