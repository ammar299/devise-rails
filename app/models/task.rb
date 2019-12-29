class Task < ApplicationRecord
	belongs_to :project
	belongs_to :user
	attr_accessor :filefield
	after_save :save_filefield
end
