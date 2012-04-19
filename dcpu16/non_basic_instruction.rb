module Dcpu16Asm
  class NonBasicInstruction < Treetop::Runtime::SyntaxNode
    def size
      size = 1
      size += 1 if value_a.next_word?
      size
    end

    def to_bin
      instruction = value_a.to_s
      instruction << non_basic_instruction_type.opcode
      instruction << '0000'
      instruction << value_a.next_word if value_a.next_word?
      [instruction].pack("B*")
    end

    protected
    
    def value_a
      elements.select{|e| e.respond_to? :next_word?}.first
    end
  end
end
