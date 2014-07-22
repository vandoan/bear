class Restaurant < ActiveRecord::Base

	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader
	geocoded_by :address 		# can also be an ip address
	after_validation :geocode 	# auto-fetch coordinates 


	belongs_to :user
	belongs_to :owner

end
