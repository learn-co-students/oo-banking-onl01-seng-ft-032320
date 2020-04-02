class Transfer
  attr_accessor :sender, :receiver, :amount 
  attr_reader :status 


  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction 
    sender.balance -= amount 
    receiver.balance += amount
    if status == "pending" && valid?
      @status = "complete"
    else 
      @status = "rejected"
      sender.balance += amount 
      receiver.balance -= amount 
      "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      sender.balance += amount 
      receiver.balance -= amount 
    end 
  end 
end
