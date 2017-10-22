class Course < ActiveRecord::Base

  validates :value, :valid_to, presence: true

  scope :forced_course_exist, -> { where("valid_to > ?", Time.now.to_datetime) }



end