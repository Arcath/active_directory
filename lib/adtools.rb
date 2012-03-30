#-- license
#
#  Based on original code by Justin Mecham and James Hunt
#  at http://rubyforge.org/projects/activedirectory
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#++ license

require 'net/ldap'

require 'adtools/config'

require 'adtools/base.rb'
require 'adtools/container.rb'
require 'adtools/member.rb'

require 'adtools/user.rb'
require 'adtools/group.rb'
require 'adtools/computer.rb'
require 'adtools/ou'

require 'adtools/field_type/password.rb'
require 'adtools/field_type/binary.rb'
require 'adtools/field_type/date.rb'
require 'adtools/field_type/timestamp.rb'
require 'adtools/field_type/dn_array.rb'
require 'adtools/field_type/user_dn_array.rb'
require 'adtools/field_type/group_dn_array.rb'
require 'adtools/field_type/member_dn_array.rb'

module Adtools
    
    def self.configure
        @config = Config.new
        yield(@config)
        Adtools::Base.setup(@config.settings_hash)
    end
    
    def self.config
        @config
    end
  #Special Fields
  def self.special_fields
    @@special_fields
  end

  def self.special_fields= sp_fields
    @@special_fields = sp_fields
  end

  @@special_fields = {

    #All objects in the AD
    :Base => {
      :objectguid => :Binary,
      :whencreated => :Date,
      :whenchanged => :Date,
      :memberof => :DnArray,
    },

    #User objects
    :User => {
      :objectguid => :Binary,
      :whencreated => :Date,
      :whenchanged => :Date,
      :objectsid => :Binary,
      :msexchmailboxguid => :Binary,
      :msexchmailboxsecuritydescriptor => :Binary,
      :lastlogontimestamp => :Timestamp,
      :pwdlastset => :Timestamp,
      :accountexpires => :Timestamp,
      :memberof => :MemberDnArray,
    },

    #Group objects
    :Group => {
      :objectguid => :Binary,
      :whencreated => :Date,
      :whenchanged => :Date,
      :objectsid => :Binary,
      :memberof => :GroupDnArray,
      :member => :MemberDnArray,
    },
    
    #OU objects
    #:Ou => {
    #  :objectguid => :Binary,
    #},
    
    #Computer Objects
    :Computer => {
        :objectguid => :Binary,
        :whencreated => :Date,
        :whenchanged => :Date,
        :objectsid => :Binary,
        :memberof => :GroupDnArray,
        :member => :MemberDnArray,
    }
  }
end
