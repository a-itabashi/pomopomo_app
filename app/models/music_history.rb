class MusicHistory < ApplicationRecord
  
  belongs_to :user
  belongs_to :music

end
