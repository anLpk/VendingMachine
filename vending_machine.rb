#Vending Machine Class

class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.
  attr_reader :snack_price_cents, :user_balance_cents
  attr_accessor :snack_count

  def initialize(snack_price_cents, snack_count)
    @user_balance_cents = 0
    @snack_price_cents = snack_price_cents
    @snack_count = snack_count
  end

  def insert_coin(input_cents)
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user inserts a coin?
    input_cents.positive? ? @user_balance_cents += input_cents : false
  end

  def buy_snack
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    if @snack_count.positive? && @user_balance_cents > 250
      @user_balance_cents -= @snack_price_cents
      @snack_count -= 1
    end
  end
end


# Buying Scenario

require_relative "vending_machine"

def display(vending_machine)
  return "---> Amount: #{vending_machine.user_balance_cents / 100.0}€" \
    " - 1 Snack = #{vending_machine.snack_price_cents / 100.0}€" \
    " - Stock: #{vending_machine.snack_count}"
end

# We instantiate a new vending machine selling 2.5 euros snacks. In the beginning
# this machine has a stock of 10 snacks.
vending_machine = VendingMachine.new(250, 10)
puts "Vending machine ready!"
puts display(vending_machine)

# A client comes and inserts some coins
puts "Inserting 2€"
vending_machine.insert_coin(200)
puts display(vending_machine)

3.times do
  puts "Inserting 0.2€"
  vending_machine.insert_coin(20)
  puts display(vending_machine)
end

# Then the client pushes the Buy snack button
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts display(vending_machine)

# Then the client pushes the Buy snack button again (but forgot to insert some more coins!)
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts display(vending_machine)
