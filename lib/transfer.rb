require "pry"

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []

  def initialize(tr_sender, tr_receiver, amount)
    @sender = tr_sender
    @receiver = tr_receiver
    @amount = amount
    @status = "pending"
    Transfer.all << self
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if valid? && @sender.balance >= @amount && @status == "pending" then
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance >= @amount then
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

  def self.all
    @@all
  end
end
