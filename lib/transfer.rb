class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false
    end
  end 
  
  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && @receiver.balance > amount && @status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
end
