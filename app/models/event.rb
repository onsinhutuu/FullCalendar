class Event < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
end
