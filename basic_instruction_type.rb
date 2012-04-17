module Dcpu16Asm
  module BasicInstructionType
    def opcode
      case text_value
      when 'SET'
        '0001'
      when 'ADD'
        '0010'
      when 'SUB'
        '0011'
      when 'MUL'
        '0100'
      when 'DIV'
        '0101'
      when 'MOD'
        '0110'
      when 'SHL'
        '0111'
      when 'SHR'
        '1000'
      when 'AND'
        '1001'
      when 'BOR'
        '1010'
      when 'XOR'
        '1011'
      when 'IFE'
        '1100'
      when 'IFN'
        '1101'
      when 'IFG'
        '1110'
      when 'IFB'
        '1111'
      end
    end
  end
end
