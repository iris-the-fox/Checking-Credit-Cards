class CreditCard

  attr_accessor :number, :company

  def initialize(number)
    @number = number.to_s.gsub(/\s/,'')
  end

end