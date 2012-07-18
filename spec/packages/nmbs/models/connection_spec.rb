require_relative '../../../../lib/ruby-irail/packages/nmbs/models/connection.rb'

describe IRail::NMBS::Connection do
  let(:connection) { IRail::NMBS::Connection.new }

  it "has an id" do
    connection.should respond_to(:id)
  end

  it "has a departure" do
    connection.should respond_to(:departure)
  end

  it "has an arrival" do
    connection.should respond_to(:arrival)
  end

  it "has a trip" do
    connection.should respond_to(:trip)
  end

  it "has a duration in seconds" do
    connection.should respond_to(:duration)
  end
end