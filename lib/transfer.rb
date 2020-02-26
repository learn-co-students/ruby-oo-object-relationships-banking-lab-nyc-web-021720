require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
 

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    Transfer.all << self
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? && receiver.valid?
    
    #can check both accounts are valid
    #calls on sender/re's #valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
    # execute a successful trans btw 2 accts
    # each trans can only happen once 
    # rejects a trans if sender does not have enough funds (does no have a valid account) -> helper method to reject
  end

  def reject_transfer
    self.status = "rejected"
    puts "Transaction rejected. Please check your account balance."
  end
  

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    #can reverse tran btw 2 accts && can reverse exectured trans
    else
      reject_transfer
    end
  end
end
