module CreditCardValidator

  def define_company
    card_patterns = [{ company: 'AMEX',
                       begins_with: /^3[47]/,
                       length: [15] },
                     { company: 'Discover',
                       begins_with: /^6011/,
                       length: [16] },
                     { company: 'Mastercard',
                       begins_with: /^5[1-5]/,
                       length: [16] },
                     { company: 'VISA',
                       begins_with: /^4/,
                       length: [13, 16] }]  

    card_patterns.each do |pattern|
      if self.number.match?(pattern[:begins_with]) && pattern[:length].include?(self.number.length)
        self.company = (pattern[:company])
      else
        self.company = 'Unknown'
      end
    end
    self.company
  end

  def luhn_validated?
    count = 0
    self.number.reverse.split('').each_slice(2) do |a,b|
      (b2 = b.to_i*2) > 9 ? count += a.to_i+((b2)-9) : count += a.to_i+((b2))
    end
    count%10 == 0 ? true :false
  end
  
end
