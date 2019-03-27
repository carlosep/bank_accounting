Rails.application.routes.draw do
  mount BankAccounting::Base, at: "/"
end
