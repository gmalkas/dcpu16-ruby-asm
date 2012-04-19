module Dcpu16Asm
  class BasicInstruction < Treetop::Runtime::SyntaxNode
    def size
      size = 1
      size += 1 if value_a.next_word?
      size += 1 if value_b.next_word?
      size
    end

    def to_bin
      instruction = value_b.to_s
      instruction << value_a.to_s
      instruction << basic_instruction_type.opcode
      instruction << value_a.next_word if value_a.next_word?
      instruction << value_b.next_word if value_b.next_word?
      [instruction].pack("B*")
    end

    protected
    
    def value_a
      elements.select{|e| e.respond_to? :next_word?}.first
    end

    def value_b
      elements.select{ |e| e.respond_to? :next_word? }[1]
    end
  end
end
