require_relative '../lib/bowling_game'

describe BowlingGame do
	let(:bg){ BowlingGame.new }
	
	it "should create a new bowling game" do
	end

	it "should roll" do
		bg.roll 0
	end

	it "should add the scores" do
		repeated_rolls 20, 3
		expect(bg.score).to eq 60
	end

	it "should add the scores up to zero" do
		repeated_rolls 20, 0
		expect(bg.score).to eq 0
	end

	it "should calculate a spare" do
		bg.roll 6
		bg.roll 4
		bg.roll 1
		repeated_rolls 17, 0
		expect(bg.score).to eq 12
	end

	it "should calculate a strike" do
		bg.roll 10
		bg.roll 7
		bg.roll 1
		repeated_rolls 16, 0
		expect(bg.score).to eq 26
	end

	it "should return a perfect score for a strike on every roll" do
		repeated_rolls 20, 10
		expect(bg.score).to eq 300
	end


	private

		def repeated_rolls repeat_number, pins
			repeat_number.times do
				bg.roll pins
			end
		end
end