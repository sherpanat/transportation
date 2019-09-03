FactoryBot.define do
  factory :journey do
    status { 'created' }
    code { '1234' }
  end

  factory :journey_cancelled do
    status { 'cancelled' }
    code { '1234' }
  end

  factory :journey_started do
    status { 'started' }
    code { '1234' }
  end
end
