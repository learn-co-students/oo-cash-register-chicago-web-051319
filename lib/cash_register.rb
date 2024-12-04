require "pry"


class CashRegister

    attr_accessor :total, :discount, :title, :price,:items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)

        self.total = total + price * quantity
        quantity.times do
        items << title
        end

        self.last_item = price * quantity

    end

    def apply_discount
        #binding.pry

        self.total =((total * (100-discount)/10000).round) *100
        if self.total>0
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        #binding.pry

        self.total = self.total - self.last_item

    end


end
