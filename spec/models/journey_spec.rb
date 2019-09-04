require 'rails_helper'

RSpec.describe Journey, type: :model do
  context 'validations' do
    it 'cannot create without a status' do
      journey = Journey.new
      expect{ journey.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(journey.errors.messages.has_key?(:status)).to be(true)
    end

    it 'cannot create a journey with an unintended status' do
      expect{ Journey.new(status: 'reserved') }.to raise_error(ArgumentError)
    end

    it 'should generate a code when created' do
      journey = create(:journey)
      expect(journey.code).to be_a(String)
      expect(journey.code.size).to be 4
    end

    it 'should log change of status' do
      journey = create(:journey)
      expect(Rails.logger).to receive(:info).with("Status of journey number #{journey.id} (code: #{journey.code}) changed from created to cancelled")
      journey.cancelled!
    end
  end
end