class Member < ApplicationRecord
  has_many :group_presences
  has_many :event_presences
  has_many :giving_lessons,
    class_name: 'Lesson',
    foreign_key: 'giving_member_id'
  has_many :taking_lessons,
    class_name: 'Lesson',
    foreign_key: 'taking_member_id'
  has_many :consultations
  has_many :recommendations

  belongs_to :school, optional: true

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
  validates :birth_date,
    presence: true
  validates :street,
    allow_blank: true,
    length: { minimum: 3 }
  validates :house_number,
    allow_blank: true,
    length: { minimum: 1 }
  validates :city,
    allow_blank: true,
    length: { minimum: 3 }
  #validates_associated :school
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

  def full_name
    first_name + " " + last_name
  end
end
