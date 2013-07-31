module View
	extend self
	GREEN = "\033[32;m"
	RED = "\033[31;m"
	NONE = ""

	def show(board_string)
		print "\e[2J\e[f"
		puts '+---+---+---+'
		board_string.split(//).each_with_index do |cell, index|
			case cell
			when 'X' then colorize(GREEN) { cell }
			when 'O' then colorize(RED) 	{ cell }
			else 					colorize(NONE) 	{ index.to_s }
			end
			puts "|\n+---+---+---+" if (index+1) % 3 == 0
		end
	end

	def congratulate(winner)
		puts winner == 'D' ? "Draw!" : "#{winner} wins!"
	end

	def move_invalid
		puts "Selection invalid!"
	end

  def colorize(ansi_color_code)
  	print "| ", ansi_color_code, yield, " \033[0m"
  end
end

if $0 == __FILE__
	View.show('XOX------')
end
