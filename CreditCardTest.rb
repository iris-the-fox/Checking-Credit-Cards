require_relative "CreditCardClass"
require "test/unit"

class CreditCardTest < Test::Unit::TestCase
    @@test_cards = [{ number: '3400 0000 0000 009',
                    company: 'AMEX',
                    valid: true }, 
                    { number: '3714 4963 5398 431',
                    company: 'AMEX',
                    valid: true }, 
                    { number: '6011 1111 1111 1117',
                    company: 'Discover',
                    valid: true },
                    { number: '5500 0000 0000 0004',
                    company: 'Mastercard',
                    valid: true }, 
                    { number: '5105 1051 0510 5100',
                    company: 'Mastercard',
                    valid: true }, 
                    { number: '4408 0412 3456 7893',
                    company: "VISA",
                    valid: true }, 
                   { number: '4222222222222',
                    company: 'VISA',
                    valid: true }, 
                  { number: '4222222222272',
                    company: 'VISA',
                    valid: false }, 
                  { number: '9999',
                    company: 'Unknown',
                    valid: false }]

  def test_company

    @@test_cards.each do |card|
      new_card = CreditCard.new(card[:number])
      new_card.define_company
      assert(new_card.company.eql?("#{card[:company]}"), "Expected card number compamy #{card[:company]}, but was #{new_card.company}" )  
    end
  end

    def test_number

    @@test_cards.each do |card|
      new_card = CreditCard.new(card[:number])
      assert(new_card.luhn_validated?.eql?(card[:valid]), "Expected card number #{card[:number]} #{card[:valid]}, but was #{new_card.luhn_validated?}" )
    end
  end

end