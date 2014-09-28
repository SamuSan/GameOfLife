class God
  $size = 19
  $seed = $size
  $grubPop = ($size **2 ) /2


  def initialize
    @world = populate_world
    for x in 0..$grubPop-1
      g = Grub.new(rand($seed), rand($seed), true)
      @world[g.x][g.y] = g
    end
    puts 'God World Created'
  end

  def populate_world
    world = Array.new($size) { Array.new($size) }
    world.each_with_index { |val, idx|
      val.each_with_index { |val_two, idx_two|
        world[idx][idx_two] = Grub.new(idx, idx_two, false)
      }
    }
    return world
  end


  def life
    living = false
    @world.each { |x|
      x.each { |y|
        y.lives ? living = true : living = living
      }
    }
    return living
  end

  def evolve
    @world.each { |x|
      x.each { |y|
        y.set_next(find_neighbours(y))
      }
    }

    @world.each { |x|
      x.each { |y|
        y.step
      }
    }
    print_next
  end

#TODO This only works for square matrices, needs to be more dynamic
  def find_neighbours(x)
    x.x - 1 < 0 ? fx = 0 : fx = x.x - 1
    x.x + 1 > @world.length-1 ? tx = @world.length-1 : tx = x.x + 1
    x.y- 1 < 0 ? fy = 0 : fy = x.y - 1
    x.y + 1 > @world[0].length-1 ? ty = @world[0].length-1 : ty = x.y + 1
    n_state = 0
    v_arrays = @world[fx..tx]
    v_arrays.each { |arr|
      h_array = arr[fy..ty]
      h_array.each { |grub|
        if (!grub.equal?(x))
          grub.lives ? n_state +=1 : n_state +=0
        end
      }
    }
    return n_state
  end

  def print_grubs
    puts '//////////'
    @world.each { |x|
      line =''
      x.each { |j|
        line += j.speak
      }
      puts line
    }
    puts '//////////'
  end


  def print_next
    puts '/////NEXT /////'
    @world.each { |x|
      line =''
      x.each { |j|
        line += j.speak
      }
      puts line
    }
    puts '/////END NEXT/////'
  end

end