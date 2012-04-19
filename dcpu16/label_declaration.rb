module Dcpu16Asm

  #
  # = LabelDeclaration
  #
  # This rule is created when a label declaration is parsed.
  #
  class LabelDeclaration < Treetop::Runtime::SyntaxNode

    #
    # Registers the label.
    #
    def register
      Program.register_label text_value.slice(1..-1)
    end
  end
end
