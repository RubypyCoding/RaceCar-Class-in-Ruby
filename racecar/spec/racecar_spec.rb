require 'racecar'

describe RaceCar do 
	let(:car1) { RaceCar.new({:name => "Force", :lap_times => [10.45, 10.44, 10.38, 10.58, 10.78]}) }
	let(:car2) { RaceCar.new({:name => "Power", :lap_times => [8.45, 8.44, 7.38, 8.58, 8.78]}) }
	let(:car3) { RaceCar.new({:name => "Passwater", :lap_times => [9.45, 9.24, 9.38, 9.68, 9.21]}) }

	describe "#initialize" do
      context "RaceCar is created" do
      	subject { RaceCar.new({:name => "Force", :lap_times => [10.45, 10.44, 10.38, 10.58, 10.78]})}
      	it(:data) { should_not be_nil }

      	it "creates a new RaceCar" do
          expect(car1).to be_an_instance_of RaceCar
        end
      end
	end

	describe "#name" do
	  context "Checks #name" do
	  	it "#name as attr_reader" do
	  	  expect(car1.name).to eq("Force")
	  	end
	  	it "#name as attr_writer" do
	  	  expect{ car1.name = "Forzy"}.to raise_error(NoMethodError)
	  	end
	  end
	end

	describe "#lap_times" do
	  context "Checks #lap_times" do
	  	it "#lap_times as attr_reader" do
	  	  expect{ car1.lap_times }.not_to raise_error
	  	end
	  	it "#lap_times as attr_writer" do 
	  	  expect{ car1.lap_times = [8.45, 8.44, 7.38, 8.58, 8.78]}.not_to raise_error
	  	end
	  end
	end

    describe "#average_speed" do
      context "Checks #average_speed" do
      	it "if #average_speed returns a string with average of speed in m/s" do
      	  expect(car1.average_speed).to eq(9.5)
      	  expect(car3.average_speed).to eq(10.65)
      	end
      end
    end

    describe "#status" do
      context "Checks #status" do
      	it "if #status returns level of race car" do
      	  car2.average_speed
      	  expect(car2.status).to eq("Medio") 
      	end
      	it "if #status returns message when there is no level of race car for average speed" do
		  car1.lap_times = [2, 2, 2, 2, 2]
      	  expect(car1.status).to eq("No status")
        end
      end
    end
end

describe Team do
	let(:car1) { RaceCar.new({:name => "Force", :lap_times => [10.45, 10.44, 10.38, 10.58, 10.78]}) }
	let(:car2) { RaceCar.new({:name => "Power", :lap_times => [8.45, 8.44, 7.38, 8.58, 8.78]}) }
	let(:car3) { RaceCar.new({:name => "Passwater", :lap_times => [9.45, 9.24, 9.38, 9.68, 9.21]}) }
	let(:car4) { RaceCar.new({:name => "Banjo", :lap_times => [9.02, 9.10, 9.12, 9.09, 9.14]}) }
	let(:car5) { RaceCar.new({:name => "Duck", :lap_times => [10.02, 9.90, 10.12, 9.50, 9.70]}) }
    let(:car6) { RaceCar.new({:name => "CooCoo", :lap_times => [7.02, 5.90, 4.12, 6.50, 8.70]}) }

	let(:team1) {[car1, car2, car3, car4, car5]}
	let(:team_one) { Team.new(team1) }
    
    describe "#initialize" do
      context "Team is created" do
      	subject { Team.new(team1)}
      	it(:team) { should_not be_nil }

      	it "creates a new RaceCar" do
          expect(team_one).to be_an_instance_of Team
        end
      end
	end

	describe "#team" do
	  context "Checks #team" do
	  	it "#team as attr_reader" do
	  	  expect{ team_one.team }.not_to raise_error
	  	end
	  	it "#team as attr_writer" do
	  	  expect{ team_one.team = car6 }.to raise_error(NoMethodError)
	  	end
	  end
	end

	describe "#add" do
	  context "Checks #add" do
	  	it "if #add inserts a new racecar object in team" do
	  	  expect(team_one.team.length).to eq(5)
	  	  expect{ team_one.add(car6) }.not_to raise_error
	  	  expect(team_one.team.length).to eq(6)
	  	end
	  end
	end

	describe "#average_speed_of_team" do
	  context "Checks #average_speed_of_team" do
	  	it "if #average_speed_of_team calculates average speed of team" do
	  	  expect(team_one.average_speed_of_team).to eq(10.66)
	  	end
	  end
	end

end

describe "#search" do
  let(:car1) { RaceCar.new({:name => "Force", :lap_times => [10.45, 10.44, 10.38, 10.58, 10.78]}) }
  let(:car2) { RaceCar.new({:name => "Power", :lap_times => [8.45, 8.44, 7.38, 8.58, 8.78]}) }
 
  let(:team1) {[car1, car2]}
  let(:team_one) { Team.new(team1) }

  context "Checks #search" do
  	it "if #search finds race car in team" do
  	  expect(search("Power", team_one)).to eq("Power is a racer")
  	end
  	it "if #search not finds race car in team" do
  	  expect(search("Duck", team_one)).to eq("Duck is not a racer")
  	end
  end
end

