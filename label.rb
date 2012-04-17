module Dcpu16Asm
  class Label < Treetop::Runtime::SyntaxNode
    def address
      Program.label_address(text_value)
    end
  end
end
