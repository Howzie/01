class Item < ActiveRecord::Base

	has_many :orders, dependent: :destroy, autosave: true
	# validates_format_of :file, :with => %r{\.(csv)$}i, :message => "Please choose a csv file!"
end
