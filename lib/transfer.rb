class Transfer
  attr_reader :sender, :receiver, :amount, :status
  @@all = []
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end

  def valid?
    (sender.valid? && sender.balance >= amount) && receiver.valid?
  end

  def execute_transaction
    if valid? && !@@all.include?(self)
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
      @@all << self
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (@status == "complete") && sender.valid? && receiver.valid? 
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    else
      "Unable to reverse transfer."
    end
  end
end
