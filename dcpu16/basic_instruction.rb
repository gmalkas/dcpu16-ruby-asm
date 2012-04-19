module Dcpu16Asm
  
  #
  # = BasicInstruction
  #
  # A basic instruction has the following pattern: INSTRUCTION a, b
  #
  # == Example
  #
  # SET A, 15
  #
  # == See also
  #
  # Please read the DCPU16's specification for the full description of basic instructions.
  #
  class BasicInstruction < Treetop::Runtime::SyntaxNode

    #
    # A basic instruction is at least one word long, at most 3 words long,
    # depending on whether or not the values need to be encoded on a full word each.
    #
    def size
      size = 1
      size += 1 if value_a.next_word?
      size += 1 if value_b.next_word?
      size
    end

    #
    # Converts the instruction to a binary string.
    #
    def to_bin
      instruction = value_b.to_s
      instruction << value_a.to_s
      instruction << basic_instruction_type.opcode
      instruction << value_a.next_word if value_a.next_word?
      instruction << value_b.next_word if value_b.next_word?
      [instruction].pack("B*")
    end

    protected
    
    #
    # Fetches the first value associated with the instruction.
    #
    def value_a
      elements.select{|e| e.respond_to? :next_word?}.first
    end

    #
    # Fetches the second value associated with the instruction.
    #
    def value_b
      elements.select{ |e| e.respond_to? :next_word? }[1]
    end
  end
end
