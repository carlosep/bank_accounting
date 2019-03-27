FactoryBot.define do
  factory :transfer do
    amount { "9.99" }
    association :source_account, factory: :account
    association :destination_account, factory: :account
  end
end
