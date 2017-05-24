class Member < ApplicationRecord
  scope :active, -> { where active: true }
  scope :disabled, -> { where active: false }

  has_many :group_presences
  has_many :event_presences

  belongs_to :school
  has_many :giving_member_id, :class_name => :lesson
  has_many :taking_member_id, :class_name => :lesson

  validates :first_name,
    presence: true,
    length: { minimum: 3 }
  validates :last_name,
    presence: true,
    length: { minimum: 3 }
  validates :pesel,
    presence: true
  validates_pesel_of :pesel
  validates :street,
    length: { minimum: 3 }
  validates :house_number,
    length: { minimum: 1 }
  validates :city,
    length: { minimum: 3 }
  validates_associated :school
  validates :work,
    length: { minimum: 3 }
  validates :phone,
    length: { maximum: 13, minimum: 9 },
    numericality: { only_integer: true }
  validates :fathers_phone,
    length: { is: 13 },
    numericality: { only_integer: true }
  validates :mothers_phone,
    length: { is: 13 },
    numericality: { only_integer: true }
end
