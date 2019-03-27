module BankAccounting
  module V1
    class Accounts < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :accounts do
        route_param :id do
          resource :balance do
            desc 'Returns current balance of account'
            get do
              account = Account.find(params[:id])
              present account.current_balance
            rescue ActiveRecord::RecordNotFound => e
              error!({ messages: 'This account does not exist.' }, 400)
            end
          end
        end
      end
    end
  end
end
