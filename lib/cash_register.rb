class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(employee_discount = 0)
    @discount = employee_discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times { @items << title }
    @last_transaction = price * quantity 
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      self.total = @total - @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    self.total -= @last_transaction
  end
end

