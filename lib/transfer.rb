class Transfer
    attr_accessor :status
    attr_reader :sender, :receiver, :amount
    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      receiver.valid? == true && sender.valid? == true ? true : false
    end

    def execute_transaction
      if @status == "pending" && self.receiver.status != "closed" && self.sender.balance > @amount
        self.sender.balance = self.sender.balance - @amount
        self.receiver.balance += @amount
        return @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete" 
        self.sender.deposit(@amount)
        self.receiver.deposit(@amount * -1)
        @status = "reversed"
      else @status != "complete"
        return false
      end
    end 
end
