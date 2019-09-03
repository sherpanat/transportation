class Journey < ApplicationRecord
  validates :status, presence: true
  enum status: { created: 'created', started: 'started', cancelled: 'cancelled' }

  before_create :set_unique_code

  def set_unique_code
    self.code = self.class.unique_code
  end

  private

  def self.unique_code
    code = ""
    loop do
      code = SecureRandom.uuid.first(4)
      break unless Journey.pluck(:code).include?(code)
    end
    return code
  end
end
