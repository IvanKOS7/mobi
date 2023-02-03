class Achievement < ApplicationRecord
  has_and_belongs_to_many :players

  def matches?(event)
    (event.count >= self.count) && (self.event == event.event)
  end
end
