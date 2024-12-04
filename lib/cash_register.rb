class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = 0
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @transaction = price
    quantity.times { @total += price }
    quantity.times { @items << title }
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      (@total *= 0.8).to_i
      "After the discount, the total comes to $#{@total.to_i.to_s}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transaction
    @total
  end
end
