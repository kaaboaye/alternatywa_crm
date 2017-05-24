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
  validates_pesel_of :pesel,
    message: I18n.t("errors.messages.invalid_pesel")
  validates :street,
    allow_blank: true,
    length: { minimum: 3 }
  validates :house_number,
    allow_blank: true,
    length: { minimum: 1 }
  validates :city,
    allow_blank: true,
    length: { minimum: 3 }
  validates_associated :school
  validates :work,
    allow_blank: true,
    length: { minimum: 3 }
  validates :phone,
    allow_blank: true,
    length: { maximum: 13, minimum: 9 },
    numericality: { only_integer: true }
  validates :fathers_phone,
    allow_blank: true,
    length: { maximum: 13, minimum: 9 },
    numericality: { only_integer: true }
  validates :mothers_phone,
    allow_blank: true,
    length: { maximum: 13, minimum: 9 },
    numericality: { only_integer: true }
end
