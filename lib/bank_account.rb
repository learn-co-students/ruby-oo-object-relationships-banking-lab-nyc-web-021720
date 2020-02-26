class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = [] # array to hold all bank accounts

    def initialize(name)
        # all accounts open with a balance of "$1k" and a status
        # of "open". add instance of bank account to class array @@all
        @name = name
        @balance = 1000
        @status = "open"
        BankAccount.all << self
    end 

    def self.all
        @@all
    end 

    def deposit(amount)
        # deposit #{amount} into current instance of account
        self.balance += amount
    end 

    def display_balance
        # displays current instance balance (self)
        "Your balance is $#{self.balance}."
    end 

    def valid?
        # returns a boolean
        # (? at end of method name is valid and ? indicates boolean)
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end 

    def close_account
        self.status = "closed"
    end 
end
