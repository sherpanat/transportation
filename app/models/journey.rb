class Journey < ApplicationRecord
  validates :status, presence: true
  enum status: { created: 'created', started: 'started', cancelled: 'cancelled' }

  before_create :set_unique_code
  after_save :log_change_of_status, if: :status_changed?

  def set_unique_code
    self.code = self.class.unique_code
  end

  private

  def log_change_of_status
    Rails.logger.info "Status of journey number #{id} (code: #{code}) changed from #{previous_changes[:status][0]} to #{previous_changes[:status][1]}"
  end

  def status_changed?
    previous_changes[:status]
  end

  def self.unique_code
    code = ""
    loop do
      code = SecureRandom.uuid.first(4)
      break unless Journey.pluck(:code).include?(code)
    end
    return code
  end
end
