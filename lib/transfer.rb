require 'pry'
class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = [] # class variable (array) contains all transfers

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

    Transfer.all << self
  end 

  def self.all
    @@all
  end 

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end 
  end 

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 

  def reverse_transfer
    # binding.pry
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else 
      reject_transfer
    end 
  end 

end
