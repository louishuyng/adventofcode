require_relative 'adv'
require_relative 'bxl'
require_relative 'bst'
require_relative 'jnz'
require_relative 'bxc'
require_relative 'out'
require_relative 'bdv'
require_relative 'cdv'

class InstructionFactory
  def execute(instruction, operand, memory, program_pointer)
    new_memory = memory
    new_pointer = program_pointer

    puts "Before mem [#{new_memory}]"

    instruction_class = instruction_by_number(instruction)
    new_memory, new_pointer, output = instruction_class.new(new_memory, operand, new_pointer).execute

    puts "After mem [#{new_memory}]"
    puts '====================='

    [new_memory, new_pointer, output]
  end

  def instruction_by_number(number)
    {
      0 => AdvInstruction,
      1 => BxlInstruction,
      2 => BstInstruction,
      3 => JnzInstruction,
      4 => BxcInstruction,
      5 => OutInstruction,
      6 => BdvInstruction,
      7 => CdvInstruction
    }[number]
  end
end