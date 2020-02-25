class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid? == true ? true : false
  end

  def execute_transaction 
    if valid? == true && self.status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
    end
  end


end

