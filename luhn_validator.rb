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
    last_digit = nums_a[-1]
    multi_nums = nums_a[0...-1].reverse.map.with_index do |digit, index|
      if index.even?
        digit * 2 > 9 ? (digit * 2) - 9 : digit * 2
      else
        digit
      end
    end
    check_digit = (10 - multi_nums.sum % 10) % 10

    # Another way to check
    # last_digit = nums_a.pop
    # multi_nums = nums_a.reverse.each_slice(2).sum { |a, b = 0| (a * 2 % 10) + (a * 2 / 10) + b }
    # check_digit = (10 - multi_nums % 10) % 10
    check_digit == last_digit
  end
end
