# bank_accounting

Simple API to execute money transfers

### Prerequisites

```
ruby '2.5.1'
rails '~> 5.2.2'
bundler '2.0.1'
```

### Installing

Clone this project:

```
git clone git@github.com:carlosep/bank_accounting.git
```

Install bundler if you do not have it installed:

```
gem install bundler
```

Intall gem dependencies with bundler, build the database and start the server:

```
bundle
rails db:setup
rails server
```
The application should be up and running.

## Usage

Accounts and Users must be created through console commands.

```
Account.create!(name: 'Account name', current_balance: 1000.00) # current_balance is not mandatory
User.create!(emai: 'user@example.com')
```
It is necessary to create a user because for every request it will be needed a user's authentication token

**Available endpoints:**

* POST /api/v1/transfers?token=YOUR_TOKEN -> Transfers money between accounts  
  * params:  
    * source_account_id -> Paying account, must have enough funds for the transfer.
    * destination_account_id -> Receiveing account
    * amount -> Ammount of money to be transfered, must be lower than the source's current balance
  * Returns newly created transfer if everything goes well

* GET /api/v1/accounts/:id/balance?token=[YOUR TOKEN] -> Returns current balance of account
  * params:
    * id -> Account Id which is going to be checked. Account must exist.
  * Returns the current balance of the pointed account

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/carlosep/bank_accounting.
