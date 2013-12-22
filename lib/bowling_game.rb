# Bowling game class consisting of rolls and scoring methods
class BowlingGame
	def initialize
		@rolls = []
	end

	def roll pins
		@rolls << pins
	end

	def score
		score, frame, frames_first_roll = 0, 0, 0
		while frame < 10
			if strike? frames_first_roll
				# Strike with added bonus points from the next two rolls
				score += 10 + strike_bonus_roll(frames_first_roll)
				frames_first_roll += 1
			elsif spare? frames_first_roll
				# Spare with added bonus points from the next roll
				score += 10 + spare_bonus_roll(frames_first_roll)
				frames_first_roll += 2
			else
				# Two rolls for each frame
				score += rolls_in_frame(frames_first_roll)
				frames_first_roll += 2
			end
			# Move to next frame
			frame += 1
		end
		score
	end

	def strike? first_roll
		@rolls[first_roll] == 10
	end

	def strike_bonus_roll first_roll
		@rolls[first_roll + 1] + @rolls[first_roll + 2]
	end

	def spare? first_roll
		@rolls[first_roll] + @rolls[first_roll + 1] == 10
	end

	def spare_bonus_roll first_roll
		@rolls[first_roll + 2]
	end

	def rolls_in_frame first_roll
		@rolls[first_roll] + @rolls[first_roll + 1]
	end

end