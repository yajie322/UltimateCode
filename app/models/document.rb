class Document < ActiveRecord::Base
  belongs_to :user
  has_many :collaboration
end
