require_relative 'CreditCardValidator'

class CreditCard
  include CreditCardValidator

  attr_accessor :number, :company

  def initialize(number)
    @number = number.to_s.gsub(/\s/,'')
  end

  def card_is_valid?
  	 self.luhn_validated? && self.define_company
  end

end