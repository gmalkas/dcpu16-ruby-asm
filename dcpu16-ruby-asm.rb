#! /usr/bin/env ruby

require 'treetop'

require_relative './dcpu16/register'
require_relative './dcpu16/literal'
require_relative './dcpu16/stack'
require_relative './dcpu16/memory_value'
require_relative './dcpu16/flag'

require_relative './dcpu16/basic_instruction_type'
require_relative './dcpu16/basic_instruction'
require_relative './dcpu16/non_basic_instruction'
require_relative './dcpu16/non_basic_instruction_type'

require_relative './dcpu16/label'
require_relative './dcpu16/label_declaration'

require_relative './dcpu16/instruction'
require_relative './dcpu16/codeline'
require_relative './dcpu16/program'

if ARGV.size != 2
  puts "Format: dcpu16-ruby-asm source ouput" 
  exit false
end

source_file, output_file = *ARGV

source = File.read(source_file)

grammar_file = File.join(File.dirname(__FILE__), "dcpu16_grammar")
Treetop.load grammar_file

parser = Dcpu16AsmParser.new
if program = parser.parse(source)
  program.compile(output_file)
else
    p parser.failure_reason
end
