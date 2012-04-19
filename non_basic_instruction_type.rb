module Dcpu16Asm
  class NonBasicInstructionType < Treetop::Runtime::SyntaxNode
    def opcode
      case text_value
      when 'JSR'
        '000001'
      end
    end
  end
end
