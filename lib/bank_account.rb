class BankAccount

    attr_reader :name
    attr_accessor :status, :balance
    @@all = []

    def initialize(account_name)
        @name = account_name
        @balance = 1000
        @status = "open"
        BankAccount.all << self
    end

    def deposit(amount)
        @balance += amount
    end

    def withdraw(amount)
        @balance -= amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end

    def self.all
        @@all
    end
end
