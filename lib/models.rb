class Service < ActiveRecord::Base
  scope :live, -> { where(is_delete: false) }
  scope :today, -> { where("created_at >= ?", Time.now.beginning_of_day)}
  has_many :messages

  def messages_hash
    result = []
    self.messages.select{|t| !t.is_delete?}.each do |msg|
      result << {id: msg.id, body: msg.body, created_at: msg.created_at}
    end
    result
  end
end

class Message < ActiveRecord::Base
  scope :live, -> { where(is_delete: false) }
  scope :today, -> { where("created_at >= ?", Time.now.beginning_of_day)}
  belongs_to :service
end