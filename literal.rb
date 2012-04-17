module Dcpu16Asm
  module Literal
    def to_s
      value = (next_word? ? 0x1F : (Literal.to_i(text_value) + 0x20)).to_s(2)
      Literal.to_bits(value, 6)
    end
    
    def next_word?
      Literal.to_i(text_value) > 0x1F
    end

    def next_word
      Literal.to_bits(Literal.to_i(text_value).to_s(2), 16)
    end

    def self.to_bits(s, n)
      s.insert(0, "0" * (n - s.size))
      s
    end

    def self.to_i(s)
      (s.include?("x")) ? s.to_i(16) : s.to_i
    end

  end
end
