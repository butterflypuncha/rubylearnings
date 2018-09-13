class Account
    attr_reader :name
    attr_reader :balance
    def initialize(name, balance=100, pin)
      @name = name
      @balance = balance
      @pin = pin
    end
  end

  public
  def withdraw(pin_number, amount)
    if pin_number == @pin
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  private
  def pin_error
    return "Access denied: incorrect PIN."
  end     

public
def display_balance(pin_number)
  if pin_number == @pin
    puts "Balance: $#{@balance}."
  else
    puts pin_error
  end
end

checking_account = Account.new("Goodo's Account", 1_000_000, 1234)
checking_account.display_balance 1234