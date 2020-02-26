class Transfer
  attr_reader :sender, :receiver, :amount, :status
    
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?
      @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && @sender.balance > @amount && @receiver.valid?
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      # if valid? && @receiver.balance > @amount && @status == "complete"
      # @receiver.balance -= @amount
      # @sender.balance += @amount
      # @status = "reversed"
      if valid? && @receiver.balance > @amount && @status == "complete"
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = "reversed"
      end
    end

end
