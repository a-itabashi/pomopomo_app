class Study < ApplicationRecord
  
  belongs_to :user

  validates :user_id, :uniqueness => {:scope => :start_at}

end
