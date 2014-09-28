require_relative 'point'
class Grub
  def initialize(xPos, yPos, alive)
    @x =xPos
    @y =yPos
    @alive = alive
    @next_state = alive
  end

  def x
    return @x
  end

  def y
    return @y
  end

  def get_pos
    puts "I am at #{@x}, #{@y}"
  end

  def lives
    return @alive
  end

  def set_next(n_state)
   if (@alive && (n_state < 2 || n_state > 3))
      @next_state = false
   elsif (@alive && (n_state == 2 || n_state == 3))
     @next_state = true
   elsif (!@alive && n_state == 3)
     @next_state = true
   end

      # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
      # Any live cell with two or three live neighbours lives on to the next generation.
      # Any live cell with more than three live neighbours dies, as if by overcrowding.
      # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  end

  def step
    @alive = @next_state
  end

  def speak
    @alive ? state = 'X' : state = '.'
    return state
  end

  def speak_next
    @next_state ? state = 'X' : state = '.'
    return state
  end

end