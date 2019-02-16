require_relative 'CreditCardClass'


def get_card_number
  card_number = gets
  @card = CreditCard.new(card_number)
  if @card.card_is_valid?
  	puts "Your card is valid"
  	puts "Your card company is #{@card.company}"
  else
  	puts "Your card is invalid. Try again"
  	get_card_number
  end
end


puts "Please, enter the credit card numbers"
get_card_number
