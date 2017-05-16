require 'pry'

class CashRegister

  attr_accessor :total, :last_transaction

  def initialize(*employee_discount)
    @total = 0
    @employee_discount = employee_discount
    @item = []
  end

def discount
  @employee_discount[0]
end

def add_item(title, price, quantity=0)
  if quantity > 0
    @total += price*quantity
    @last_transaction = price*quantity
    quantity.times do |x|
      @item << title
    end
  else
    @total += price
    @item << title
    @last_transaction = price
end
end

def apply_discount
  if discount
    @total = (@total * (1-(discount.to_f/100)))
    return "After the discount, the total comes to $#{@total.to_i}."
  else
    return "There is no discount to apply."
  end
end

def items
  @item
end

def void_last_transaction
  @total -= @last_transaction
# binding.pry
end



end
