module Dcpu16Asm
  module Register
    def to_s
      case text_value
      when 'A'
        '000000'
      when 'B'
        '000001'
      when 'C'
        '000010'
      when 'X'
        '000011'
      when 'Y'
        '000100'
      when 'Z'
        '000101'
      when 'I'
        '000110'
      when 'J'
        '000111'
      when 'SP'
        '011011'
      when 'PC'
        '011100'
      end
    end

    def next_word?
      false
    end
  end
end
