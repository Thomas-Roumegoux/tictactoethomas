class BoardCase
  attr_accessor :statue, :content, :position

	def initialize
		@statue = true
		@content = " "
		@@position = 1
	end

end
class Board
	attr_accessor :board
	include Enumerable

	def initialize
		@board = []
		@board[0] = @content
		@board[1] = @content
		@board[2] = @content
		@board[3] = @content
		@board[4] = @content
		@board[5] = @content
		@board[6] = @content
		@board[7] = @content
		@board[8] = @content
	end

	def display
		puts " #{@board[0]}  | #{@board[1]} | #{@board[2]} "
		puts "----------"
		puts " #{@board[3]}  | #{@board[4]} | #{@board[5]} "
		puts "----------"
		puts " #{@board[6]}  | #{@board[7]} | #{@board[8]} "
	end

	def play(ma_piece,ma_position)
		@board[ma_position.to_i - 1] = ma_piece.to_s
	end

	def victory?
		@win_status = 0
		if (@board[0] == @board[1] && @board[0] == @board[2]) || (@board[3] == @board[4]&& @board[3] == @board[5]) || (@board[7] == @board[8] && @board[7] == @board[9]) || (@board[0] == @board[4] && @board[0] == @board[8]) || (@board[6] == @board [4] && @board[6] == @board[2]) || (@board[0] == @board[3] && @board[0] == @board[6]) || (@board[1] == @board[4] && @board[1] == @board[7]) || (@board[2] == @board[5] && @board[2] == @board[8])
		@win_status = 1
		end
	end
end
class Player
	attr_accessor :name, :piece
	attr_writer :win

	def initialize
		@name = name
		@piece = piece
	end
end

class Game
	def initialize
		@b_start = true
		init_player
		init_board
	end

	def init_player
		puts "Player1, what's your name ?:"
		@name1 = gets.chomp
		puts "Player2, what's your name ?:"
		@name2 = gets.chomp
		@player1 = Player.new
		@player1.name = @name1
		@player1.piece = "X"
		@player2 = Player.new
		@player2.name = @name2
		@player2.piece = "O"
	end
	

	def init_board
	@my_board = Board.new
	end


	def go
    @i = 1
		while @i < 11
			if @i == 1 || @i == 3 || @i == 5 || @i == 7 || @i == 9
				puts "#{@name1} à toi de jouer ! Choisis une case entre 1 et 9:"
				turn
				@my_board.play("X",@position)
				@i = @i + 1
			end
			if @i == 2 || @i == 4 || @i == 6 || @i == 8
				puts "#{@name2} à toi de jouer ! Choisis une case entre 1 et 9:"
				turn
				@my_board.play("O",@position)
				@i = @i + 1
			end
		end
	end
	def turn
	@my_board.display
	@position = gets.chomp
	@my_board.victory?
		if @win_status == 1
			puts "Bravo tu as gagné !"
		end
		if @win_status == 0
		puts "Match nul comme vous,relancez le programme !"
		end
	end
end
plateau = 0
plateau = Game.new.go
