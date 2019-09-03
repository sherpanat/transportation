FactoryBot.define do
  factory :journey do
    status { 'created' }
  end

  factory :journey_cancelled, class: Journey do
    status { 'cancelled' }
  end

  factory :journey_started, class: Journey do
    status { 'started' }
  end
end
