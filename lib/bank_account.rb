class BankAccount

    attr_reader :name
    attr_accessor :balance, :status
    @@all = []

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
        BankAccount.all << self
    end


    def deposit(amount)
        self.balance += amount
    end

    def display_balance 
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end

end
