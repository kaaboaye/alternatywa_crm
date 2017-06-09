class Lesson < ApplicationRecord
  belongs_to :lesson_subject
  belongs_to :giving_member,
    class_name: 'Member',
    foreign_key: 'giving_member_id'
  belongs_to :taking_member,
    class_name: 'Member',
    foreign_key: 'taking_member_id'

  validates_associated :giving_member
  validates_associated :taking_member
  validates_associated :lesson_subject
  
  validates :time,
    presence: true
  validates :datetime,
    presence: true
end
