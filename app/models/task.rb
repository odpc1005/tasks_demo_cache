class Task < ApplicationRecord
  validates :body, presence: true
  
  def say_hey
    "hey"
  end

end

