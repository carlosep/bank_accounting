FactoryBot.define do
  factory :transfer do
    amount { "1000.00" }
    association :source_account, factory: :account
    association :destination_account, factory: :account
  end
end
