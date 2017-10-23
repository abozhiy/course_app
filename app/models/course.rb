class Course < ActiveRecord::Base
  require 'net/http'

  validates :value, :valid_to, presence: true

  scope :forced_course_exist, -> { where("valid_to > ?", Time.now.to_datetime) }

  def self.course_showing
    UpdateCourseJob.perform_now
  end

  def current_course
    Net::HTTP.get(URI('http://www.rbc.ru/')).scan(%r{<span class="indicators__ticker__td indicators__ticker__val1">(.*)</span>}).first.join()
  end
end