module Dcpu16Asm
  
  #
  # = NonBasicInstruction
  #
  # A non-basic instruction has the following pattern (at least in the version 1.1 of the specification)
  #
  # INSTRUCTION a
  #
  # == Example
  #
  # JSR 0x15
  #
  # == See also
  #
  # Please read the DCPU16's specification for the full description of non-basic instructions.
  #
  class NonBasicInstruction < Treetop::Runtime::SyntaxNode

    #
    # A non basic instruction is at least one word long, at most 2 words long,
    # depending on whether or not the value needs to be encoded on a full word.
    #
    def size
      size = 1
      size += 1 if value_a.next_word?
      size
    end

    #
    # Converts the instruction to a binary string.
    #
    def to_bin
      instruction = value_a.to_s
      instruction << non_basic_instruction_type.opcode
      instruction << '0000'
      instruction << value_a.next_word if value_a.next_word?
      [instruction].pack("B*")
    end

    protected
    
    #
    # Fetches the value associated with the instruction.
    #
    def value_a
      elements.select{|e| e.respond_to? :next_word?}.first
    end
  end
end
