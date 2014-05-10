class Certify < ActiveRecord::Base
    attr_accessor :account, :password
    @@digest = Digest::SHA512.new
    def Certify.digest
        @@digest
    end

    def Certify.crypt target
        digest.hexdigest target
    end

    def Certify.authorize name, password
        target = find( :first, :conditions=> { :userName=>name, :password=>crypt(name + ":" + password), :disable=>0 }, :select=>'userId')
        if target != nil
            target['userId']
        else
            false
        end
    end
end
