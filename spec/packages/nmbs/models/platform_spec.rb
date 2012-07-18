require_relative '../../../../lib/ruby-irail/packages/nmbs/models/platform.rb'

describe IRail::NMBS::Platform do
  let(:platform) { IRail::NMBS::Platform.new }

  it "has an id" do
    platform.should respond_to(:number)
  end
end