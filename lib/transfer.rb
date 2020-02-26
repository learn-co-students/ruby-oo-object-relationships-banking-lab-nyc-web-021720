class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount
  def initialize(sender,receiver,amount)
    @transfer=transfer
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end
  def valid? 
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer

    end
  end
  def reverse_transfer
    if execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      self.status="reversed"
    end
  end
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  

end
