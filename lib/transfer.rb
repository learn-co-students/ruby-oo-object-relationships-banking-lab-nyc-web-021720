class Transfer

  @@all=[]
  attr_accessor :status
  attr_reader :sender, :receiver, :amount 
  


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end  

 def self.all
  @@all
 end 
 

 def valid?
   @sender.valid? == true  && @receiver.valid? == true
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
     if valid? && @receiver.balance > @amount && @status == "complete"
      @receiver.balance -= @amount 
      @sender.balance += @amount
      @status = "reversed"
     end 
end 

end 

