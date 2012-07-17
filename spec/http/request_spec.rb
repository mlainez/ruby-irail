require_relative "../../lib/http/request.rb"

describe Request do
  class HTTParty
  end

  describe :'self.get' do
    let(:url)      { mock("Url") }
    let(:request)  { mock("Request") }
    let(:response) { mock("Response") }
    let(:body)     { mock("Body") }

    before :each do
      HTTParty.stub(:get => request)
      request.stub(:response => response)
      response.stub(:body => body)
    end

    it "calls the get method of HTTParty with the url as param" do
      HTTParty.should_receive(:get).with(url)
      Request.get(url)
    end

    it "gets the body from the response" do
      response.should_receive(:body)
      Request.get(url)
    end

    it "returns the response body" do
      Request.get(url).should eql body
    end
  end
end