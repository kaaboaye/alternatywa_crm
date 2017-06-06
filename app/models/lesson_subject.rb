class LessonSubject < ApplicationRecord
  has_many :subjects

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
