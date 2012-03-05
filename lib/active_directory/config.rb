module ActiveDirectory
    class Config
        attr_accessor :domain, :port, :base, :server, :query_user, :query_password
        
        # Creates a new instance of ActiveDirectory::Config
        #
        # Sets port, allowed_groups, denied_groups, ad_sv_attrs and ad_mv_attrs to default so they can be omitted from the config
        def initialize
            @port = 389
        end

        # Sets domain valiable
        #
        # Called as:
        #    ActiveDirectory::Config.domain=(s)
        #
        # Calculates both base string and server
        def domain=(s)
            @domain = s
            work_out_base(s)
            @server ||= s
        end
            
        def settings_hash
            {
                :host => @server,
                :base => @base,
                :port => @port,
                :auth => {
                  :method => :simple,
                  :username => "#{@query_user}@#{@domain}",
                  :password => @query_password
                }
            }
        end

        private

        def work_out_base(s)
            @base ||= s.gsub(/\./,', dc=').gsub(/^/,"dc=")
        end
    end
end