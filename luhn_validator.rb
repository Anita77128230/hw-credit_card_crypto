# frozen_string_literal: true

# modul LuhnValidator use for check numbers
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    last_digit = nums_a.pop
    multi_nums = nums_a.reverse.each_with_index { |digit, index|
      if index.even?
        digit * 2 > 9 ? (digit * 2) - 9 : digit * 2
      else
        digit
      end
    }
    check_digit = (10 - multi_nums.sum % 10) % 10

    check_digit == last_digit
  end
end
