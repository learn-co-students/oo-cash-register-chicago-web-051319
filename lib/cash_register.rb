require 'pry'

class CashRegister
   attr_accessor :total, :discount, :last_transaction, :quantity, :items


    def initialize(discount=0)
        @total = 0
        @discount = discount
        @last_transaction = 0
        @items = []
    end

    def add_item(title,price,quantity=1)
        @title = title
        @price = price
        @quantity = quantity
        subtotal = 0
        if quantity > 1
            subtotal = @price * quantity
        else
            subtotal = @price
        end
        self.total += subtotal
        @last_transaction = subtotal
        quantity.times do
            @items << title
        end
    end

    def apply_discount
        if @discount > 0
            discounted_amount = self.total * 0.2
            self.total -= discounted_amount
            p "After the discount, the total comes to $#{self.total.to_i}."
        else
            p "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end

end