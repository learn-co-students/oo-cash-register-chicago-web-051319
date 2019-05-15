class CashRegister
  attr_accessor :discount,:total,:item_list,:last_transaction
  # attr_reader :total

  # self.item_list=[]

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_list=[]
  end

  def add_item(title,price,quantity=1)
    count=0
    quantity.times do
      self.item_list << title
    end
    self.last_transaction=price*quantity
    self.total+=self.last_transaction
  end

  def apply_discount
    if self.discount != 0
      self.total=(self.total - self.total * self.discount / 100.00).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.item_list
  end

  def void_last_transaction
    self.total-=self.last_transaction
  end
end

# obj=CashRegister.new
# obj.add_item("Item 1",1)
# p obj.total
