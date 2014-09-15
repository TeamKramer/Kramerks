class Bookmark < ActiveRecord::Base
	validate :url_has_valid_tld

	def url_has_valid_tld
		unless PublicSuffix.valid?(url)
			errors.add(:url, "URL does not end in TLD")
		end
	end



end
