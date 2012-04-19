module Dcpu16Asm

  #
  # = Instruction
  #
  # An instruction is either a basic instruction or a non-basic instruction, followed by an optional comment.
  #
  class Instruction < Treetop::Runtime::SyntaxNode

    #
    # Converts the instruction to a binary string.
    #
    def to_bin
      instruction.to_bin
    end

    #
    # Returns the instruction's length (in words).
    #
    def size
      instruction.size
    end

    protected

    #
    # Returns the basic instruction (or non-basic instruction).
    #
    def instruction
      elements.select { |i| i.is_a?(BasicInstruction) || i.is_a?(NonBasicInstruction)}.first
    end
  end
end
