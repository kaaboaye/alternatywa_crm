class Member < ApplicationRecord
    has_many :group_presences
    has_many :event_presences

    belongs_to :school
    has_many :giving_member_id, :class_name => :lesson
    has_many :taking_member_id, :class_name => :lesson
end
