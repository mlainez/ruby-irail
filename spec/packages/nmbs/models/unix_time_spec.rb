require_relative '../../../../lib/ruby-irail/packages/nmbs/models/unix_time.rb'

describe IRail::NMBS::UnixTime do
  let(:unix_time) { IRail::NMBS::UnixTime.new }

  it "has a format" do
    unix_time.should respond_to(:format)
  end

  it "has a unixtime" do
    unix_time.should respond_to(:time)
  end
end