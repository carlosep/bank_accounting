module BankAccounting
  module V1
    class Transfers < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :transfers do
        desc 'Transfers money between accounts'
        post do
          authenticate!
          transfer = Transfer.new(params[:transfer])
          if transfer.enough_funds?
            present transfer if transfer.save!
          else
            error!({ messages: 'Source account has insufficient funds' }, 400)
          end
        end
      end
    end
  end
end
