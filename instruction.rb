module Dcpu16Asm
  class Instruction < Treetop::Runtime::SyntaxNode
    def to_bin
      # If there is a label, we need to register it
      label.register if has_label?
      # Find the instruction, either BasicInstruction or NonBasicInstruction
      instruction.to_bin
    end

    def size
      instruction.size
    end

    protected

    def has_label?
      not label.nil?
    end

    def label
      @label ||= elements.select { |e| e.is_a? LabelDeclaration }.first
    end

    def instruction
      @instruction ||= elements.select { |i| i.is_a?(BasicInstruction) || i.is_a?(NonBasicInstruction)}.first
    end
  end
end
