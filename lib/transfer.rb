require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      
    elsif valid? && @status != "complete"
    
      @receiver.balance += @amount
      @sender.balance -= @amount
      #binding.pry
      @status = "complete"
    end
  end
  
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
    
  
  
  

end
