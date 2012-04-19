module Dcpu16Asm
  class Codeline < Treetop::Runtime::SyntaxNode
    def to_bin
      instruction? ? instruction.to_bin : nil
    end

    def register_labels
      label.register if label?
    end
    
    def size
      (instruction?) ? instruction.size : 0
    end

    protected
    
    def instruction?
      not elements.select { |e| e.respond_to?(:to_bin) }.empty?
    end

    def instruction
      elements.select { |e| e.respond_to?(:to_bin) }.first
    end

    def label?
      not elements.select { |e| e.respond_to?(:label) }.empty?
    end

    def label
      elements.select { |e| e.respond_to?(:label) }.first.label
    end
  end
end
