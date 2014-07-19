class Restaurant < ActiveRecord::Base

	mount_uploader :image, ImageUploader
#	mount_uploader :attachment, AttachmentUploader
	geocoded_by :address 		# can also be an ip address
	after_validation :geocode 	# auto-fetch coordinates 
end
