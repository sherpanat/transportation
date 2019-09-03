class Journey < ApplicationRecord
  validates :code, :status, presence: true
  enum status: { created: 'created', started: 'started', cancelled: 'cancelled' }
end
