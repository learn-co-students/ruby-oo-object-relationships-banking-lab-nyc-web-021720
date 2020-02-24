class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    #check both accounts to see if they are both valid. 
    #.valid? checks validity. returns true || false. https://www.twilio.com/blog/2017/06/validate-ruby-objects-with-active-model-validations.html
    sender.valid? && receiver.valid?
  end
#check for validity of both accs, make sure sender balance is above the amount, status = pending to make sure transaction can only happen once.
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance." 
    end
  end
#same thing as previous method but in reverse. status must be complete in order to reverse. 
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
end
