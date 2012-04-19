module Dcpu16Asm

  #
  # = NonBasicInstructionType
  #
  # Maps the non-basic instruction's name with its binary opcode.
  #
  class NonBasicInstructionType < Treetop::Runtime::SyntaxNode

    #
    # Returns the opcode corresponding to the instruction.
    #
    # == Returns
    #
    # A string of characters
    #
    def opcode
      case text_value
      when 'JSR'
        '000001'
      end
    end
  end
end
