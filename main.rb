require_relative 'god'
require_relative 'grub'
require 'set'
require 'tk'


$god = God.new()
while $god.life do
  $god.print_grubs
  $god.evolve
end

