# Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status


class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = 'pending'
  end

  def self.all 
    @@all 
  end 
  

  def valid?
    sender.valid? && receiver.valid? ? true : false 
  end

  def execute_transaction 

    unless self.class.all.include?(self)
      if valid? && (self.sender.balance - self.amount) >= 0
        self.receiver.balance += self.amount 
        self.status = 'complete'
        self.class.all << self 
        self.sender.balance -= self.amount 
      else 
        self.status = 'rejected'
        'Transaction rejected. Please check your account balance.'
      end
    end
  end

  def reverse_transfer
    if self.class.all.include?(self)
      self.sender.balance +=  self.amount
      self.receiver.balance -= self.amount 
      self.status = 'reversed'
    end
  end

end
