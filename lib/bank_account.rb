class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        BankAccount.all << self
    end

    def self.all 
        @@all
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end

    def close_account
        self.status = "closed"
    end
end
