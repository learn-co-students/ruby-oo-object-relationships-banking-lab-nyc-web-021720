require "pry"
class Transfer
  
  attr_reader :sender,:receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount
  end

  def valid? 
    sender.valid? and receiver.valid? ## How is this method used inside it's own scope
    # binding.pry 
  end

  def execute_transaction 
    if valid? && sender.balance > amount && status =="pending"
     sender.balance -= amount
      receiver.balance += amount 
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer
    if execute_transaction #why can these methods just be called 
      sender.balance += amount
      receiver.balance -= amount 
      # binding.pry 
      self.status = "reversed"
    end
  end


end

