module Dcpu16Asm
  class Instruction < Treetop::Runtime::SyntaxNode
    def to_bin
      # Find the instruction, either BasicInstruction or NonBasicInstruction
      instruction.to_bin
    end

    def size
      instruction.size
    end

    protected

    def instruction
      @instruction ||= elements.select { |i| i.is_a?(BasicInstruction) || i.is_a?(NonBasicInstruction)}.first
    end
  end
end
