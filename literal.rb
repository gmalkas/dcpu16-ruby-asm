module Dcpu16Asm
  module Literal
    def to_s
      value = (next_word? ? 0x1F : (text_value.to_i(16) + 0x20)).to_s(2)
      Literal.to_bits(value, 6)
    end
    
    def next_word?
      text_value.to_i(16) > 0x1F
    end

    def next_word
      Literal.to_bits(text_value.to_i(16).to_s(2), 16)
    end

    def self.to_bits(s, n)
      s.insert(0, "0" * (n - s.size))
      s
    end

  end
end
