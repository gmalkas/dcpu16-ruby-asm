module Dcpu16Asm
  
  # = Codeline
  # 
  # A code line is either a label declaration, an instruction or a comment.
  #
  class Codeline < Treetop::Runtime::SyntaxNode

    #
    # Converts the instruction to a binary string.
    #
    def to_bin
      instruction? ? instruction.to_bin : nil
    end

    #
    # Registers the label if there is one.
    #
    def register_labels
      label.register if label?
    end
    
    #
    # Returns the instruction's length (in words).
    #
    def size
      (instruction?) ? instruction.size : 0
    end

    protected
    
    #
    # Returns true if there is an 'instruction' child node.
    #
    def instruction?
      not elements.select { |e| e.respond_to?(:to_bin) }.empty?
    end

    #
    # Returns the 'instruction' child node.
    #
    def instruction
      elements.select { |e| e.respond_to?(:to_bin) }.first
    end

    #
    # Returns true if there is a 'label' child node.
    #
    def label?
      not elements.select { |e| e.respond_to?(:label) }.empty?
    end

    #
    # Returns the 'label' child node.
    #
    def label
      elements.select { |e| e.respond_to?(:label) }.first.label
    end
  end
end
