module Dcpu16Asm
  class Program < Treetop::Runtime::SyntaxNode
    @@labels = Hash.new 
    @@position = 0

    def self.register_label(label)
      raise "The label #{label} has already been defined!" if @@labels.key? label 

      @@labels.store(label, @@position + 1)
    end

    def self.label_address(label)
      raise "Unknown label #{label}" unless @@labels.key? label
      @@labels[label]
    end

    def compile(filename)
      File.open(filename, 'wb') do |f|
        elements.each do |instruction|
          f.write instruction.to_bin
          @@position += instruction.size
        end
      end
    end
  end
end
