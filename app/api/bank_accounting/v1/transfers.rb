module BankAccounting
  module V1
    class Transfers < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :transfers do
        desc 'Transfers money between accounts'
        post do
          Transfer.create!(params[:transfer])
        end
      end
    end
  end
end
