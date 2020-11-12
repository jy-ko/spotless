class Room < ApplicationRecord
    has_many :tasks, :dependent => :destroy

end
