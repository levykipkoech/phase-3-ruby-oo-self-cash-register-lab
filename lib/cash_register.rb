# class CashRegister
#   attr_accessor :total, :discount

#   def initialize(discount = 0)
#     @total = 0
#     @discount = discount
#     @items = []
#   end

#   def add_item(title, price, quantity = 1)
#     @items.concat([title] * quantity)
#     @total += price * quantity
#   end

#   def apply_discount
#     if @discount == 0
#       return "There is no discount to apply."
#     else
#       @total = (@total * (100 - @discount) / 100).round(2)
#       return "After the discount, the total comes to $#{@total}."
#     end
#   end

#   def items
#     @items
#   end

#   def void_last_transaction(total, items)
#     @items.delete(-1)
#     self.total -= @sumprice.last
#     @total
  
#   end
# end
class CashRegister
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = Array.new
    @transactions = Array.new
  end

  def add_item(title, price, quantity = 1)
    @transactions << [title, price, quantity]
    @items << [title] * quantity
    self.total += price * quantity
  end

  def apply_discount
    percent_discount = (100 - self.discount)
    unless self.discount <= 0
        self.total = @total*percent_discount/100
        return "After the discount, the total comes to $#{self.total.to_i}."
    end
        return "There is no discount to apply."
  end
  def items
    @items.flatten
  end
  

  def void_last_transaction
    return if @transactions.empty?
    last_transaction = @transactions.pop
    title, price, quantity = last_transaction
    @items.pop(quantity)
    self.total -= price * quantity
  end
end
