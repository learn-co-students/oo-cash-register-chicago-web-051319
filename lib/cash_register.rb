class CashRegister

    attr_accessor :total , :employee_discount , :items, :last_action

    def initialize(_discount = 1)
        @total = 0.0
        @employee_discount = _discount
        @items = []
    end

    def total
        return @total
    end

    def total=(num)
        @total = num
    end

    def discount
        @employee_discount
    end

    def discount=(num)
        @employee_discount = num
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            @items << title
        end
        
        self.last_action = price * quantity
        self.total = (price * quantity) + total
    end

    def apply_discount
        if self.employee_discount == 1
            return "There is no discount to apply."
        end

        dc = self.employee_discount * 0.01
        dc *= self.total
        self.total -= dc
        return "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= last_action
    end
end

