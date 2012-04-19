module Dcpu16Asm
  #
  # = Literal
  #
  #  A literal value (e.g 10 or 0x541)
  #
  module Literal

    #
    # Returns the binary representation of the literal value.
    #
    # A literal value needs a complementary word 
    # if its value is greater than 0x1F.
    #
    def to_s
      value = (next_word? ? 0x1F : (Literal.to_i(text_value) + 0x20)).to_s(2)
      Literal.to_bits(value, 6)
    end
    
    def next_word?
      Literal.to_i(text_value) > 0x1F
    end

    #
    # Returns the literal value as a string of 16 characters.
    #
    # == Returns
    #
    # A string of characters.
    #
    def next_word
      Literal.to_bits(Literal.to_i(text_value).to_s(2), 16)
    end

    #
    # Prepends '0' to the string to obtain a string of 'n' characters.
    #
    # == Parameters
    # s::
    #   The string to complete.
    # n:: 
    #   The length of the final string.
    #
    # == Returns
    #
    # The string of length 'n'
    #
    def self.to_bits(s, n)
      s.insert(0, "0" * (n - s.size))
      s
    end

    #
    # Converts a string to an integer, using a 10 or 16 base according to
    # the presence of a '0x' prefix.
    #
    # == Parameters
    #
    # A string
    #
    # == Returns
    #
    # An integer
    #
    def self.to_i(s)
      (s.include?("x")) ? s.to_i(16) : s.to_i
    end

  end
end
