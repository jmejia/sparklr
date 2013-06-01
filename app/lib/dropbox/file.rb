module Dropbox
  class File
    def self.find_from_dropbox(user, filename)
      user.find(filename)
    end

  end
end
