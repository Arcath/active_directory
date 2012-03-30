module Adtools
	class Ou < Base
		def self.filter
			Net::LDAP::Filter.eq(:objectClass,'organizationalUnit')
		end

		def self.required_attributes
			{ :objectClass => [ 'top', 'organizationalUnit' ] }
		end
	end
end