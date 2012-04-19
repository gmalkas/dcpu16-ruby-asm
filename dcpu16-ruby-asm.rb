require 'treetop'

require_relative './register'
require_relative './literal'
require_relative './stack'
require_relative './memory_value'
require_relative './flag'

require_relative './basic_instruction_type'
require_relative './basic_instruction'
require_relative './non_basic_instruction'
require_relative './non_basic_instruction_type'

require_relative './label'
require_relative './label_declaration'

require_relative './instruction'
require_relative './codeline'
require_relative './program'

require_relative './dcpu16_grammar'

if ARGV.size != 2
  puts "Format: dcpu16-ruby-asm source ouput" 
  exit false
end

source_file, output_file = *ARGV

source = File.read(source_file)

Treetop.load "dcpu16_grammar"

parser = Dcpu16AsmParser.new
if program = parser.parse(source)
  program.compile(output_file)
else
    p parser.failure_reason
end
