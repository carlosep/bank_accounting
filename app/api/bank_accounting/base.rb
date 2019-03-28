module BankAccounting
  class Base < Grape::API
    helpers do
      def authenticate!
        current_user = User.find_by_token(params[:token])
        return current_user if current_user.present?

        error!('401 Not Authorized. Check your acccess token', 401)
      end
    end
    mount BankAccounting::V1::Accounts
    mount BankAccounting::V1::Transfers
  end
end
