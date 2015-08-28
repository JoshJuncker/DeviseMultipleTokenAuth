module DeviseMultipleTokenAuth
  class Device < ActiveRecord::Base
    self.inheritance_column = :platform
    belongs_to :user
  end
end
