module Dcpu16Asm
  module Flag
    def to_s
      case text_value
      when 'O'
        '011101'
      end
    end

    def next_word?
      false
    end
  end
end

