module Dcpu16Asm
  module Stack
    def to_s
      case text_value
      when 'POP'
        '011000'
      when 'PEEK'
        '011001'
      when 'PUSH'
        '011010'
      end
    end

    def next_word?
      false
    end
  end
end
