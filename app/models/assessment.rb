class Assessment < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :questions

  validates_presence_of :title, :creator
end
