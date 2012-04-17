require 'treetop'

require_relative './register'
require_relative './value'
require_relative './basic_instruction_type'
require_relative './basic_instruction'
require_relative './non_basic_instruction'
require_relative './label'
require_relative './label_declaration'
require_relative './instruction'
require_relative './program'
require_relative './dcpu16_grammar'

raise "Need a source!" if ARGV.first.nil?
dest = ARGV.first

Treetop.load "dcpu16_grammar"

source = <<ASM
  SET A, 0x30              ; 7c01 0030
  SET [0x1000], 0x20       ; 7de1 1000 0020
  loop: SUB A, [0x1000]          ; 7803 1000
ASM

parser = Dcpu16AsmParser.new
if program = parser.parse(source)
  program.compile(dest)
else
    puts parser.failure_reason
end
