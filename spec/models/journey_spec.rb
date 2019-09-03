require 'rails_helper'

RSpec.describe Journey, type: :model do
  context 'validations' do
    it 'cannot create without a status' do
      journey = Journey.new
      expect{ journey.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(journey.errors.messages.has_key?(:status)).to be(true)
    end

    it 'cannot create without a code' do
      journey = Journey.new
      expect{ journey.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(journey.errors.messages.has_key?(:code)).to be(true)
    end

    it 'cannot create a journey with an unintended status' do
      expect{ Journey.new(status: 'reserved') }.to raise_error(ArgumentError)
    end
  end
end
