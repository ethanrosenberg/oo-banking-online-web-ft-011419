class BankAccount
  
  attr_reader :name, :balance
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
end
