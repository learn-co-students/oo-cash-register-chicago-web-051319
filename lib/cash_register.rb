require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :count

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @count = 0
  end

  def add_item(title, price, quantity = 1)
    @count = price
    self.total += price*quantity
      if quantity > 1
        quantity.times do
        @items << title
        end
      else
        @items << title
      end
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = (self.total - calc_discount).to_i
    return "After the discount, the total comes to $#{self.total}."
    end
  end

  def calc_discount
    self.total*(self.discount.to_f/100)
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.total - self.count
  end

end
