class BankAccount
    #### Attributes ####
    attr_reader :name
    attr_accessor :balance, :status
    #### Instance Methods ####
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def close_account
        self.status = "closed"
    end
    #### Class Methods ####
end
