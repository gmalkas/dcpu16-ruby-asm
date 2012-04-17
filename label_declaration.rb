module Dcpu16Asm
  class LabelDeclaration < Treetop::Runtime::SyntaxNode
    def register
      Program.register_label text_value.slice(1..-1)
    end
  end
end
