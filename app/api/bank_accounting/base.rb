module BankAccounting
  class Base < Grape::API
    mount BankAccounting::V1::Accounts
    mount BankAccounting::V1::Transfers
  end
end
