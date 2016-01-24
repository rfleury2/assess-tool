class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :answers

  validates_presence_of :prompt
end
