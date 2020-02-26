require "pry"
class BankAccount
    attr_accessor :balance, :status

    attr_reader :name 

    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        BankAccount.all << self
    end

    def deposit(deposit)
        self.balance += deposit
        # can deposit money into it's account
    end

    def display_balance
        "Your balance is $#{self.balance}."
        # can display its balance
    end

    def valid?
        status == "open" && balance > 0
        # is valid with an open status and a balance greater than 0
    end

    def close_account
        # can close its account
        self.status = "closed"
    end

    def self.all
        @@all
    end
end
