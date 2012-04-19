module Dcpu16Asm
  class Program < Treetop::Runtime::SyntaxNode
    @@labels = Hash.new 
    @@position = 0

    def self.register_label(label)
      raise "The label #{label} has already been defined!" if @@labels.key? label 

      @@labels.store(label, @@position)
    end

    def self.label_address(label)
      raise "Unknown label #{label}" unless @@labels.key? label
      @@labels[label]
    end

    def compile(filename)
      # First pass - define labels
      elements.each do |codeline|
        codeline.register_labels
        @@position += codeline.size
      end

      # Second pass - write to binary file
      File.open(filename, 'wb') do |f|
        elements.each do |codeline|
          f.write codeline.to_bin
        end
      end
    end

  end
end
