class Restaurant < ActiveRecord::Base

	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader
	geocoded_by :address 		# can also be an ip address
	after_validation :geocode 	# auto-fetch coordinates 


	belongs_to :users
	belongs_to :owners
	has_many :reservations
	


end
