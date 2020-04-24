class User < ActiveRecord::Base
	has_many :documents
	has_many :collaborations

	def self.find_or_create_with_omniauth(auth)
		where(:provider => auth.provider, :uid => auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
			# user.picture = auth.info.image
			user.save!
		end
	end
end
