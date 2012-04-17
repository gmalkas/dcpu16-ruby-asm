module Dcpu16Asm
  module Label
    def to_s
      '011111'
    end

    def next_word?
      true
    end

    def next_word
      Literal.to_bits(Program.label_address(text_value).to_s(2), 16)
    end
  end
end
