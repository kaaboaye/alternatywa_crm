class Lesson < ApplicationRecord
    belongs_to :lesson_subject
    has_many :giving_member_id, :class_name => :member
    has_many :taking_member_id, :class_name => :member
end
