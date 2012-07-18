require_relative "../../lib/ruby-irail/http/request.rb"

describe IRail::Request do
  class HTTParty
  end

  describe :'self.get' do
    let(:url)      { mock("Url") }
    let(:request)  { mock("Request") }
    let(:response) { mock("Response") }
    let(:body)     { mock("Body") }
    let(:options)  { mock("Options") }

    before :each do
      HTTParty.stub(:get => request)
      request.stub(:response => response)
      response.stub(:body => body)
    end

    it "calls the get method of HTTParty with the url as param and an empty default hash as options" do
      HTTParty.should_receive(:get).with(url, {})
      IRail::Request.get(url)
    end

    it "calls the get method of HTTParty with the url asa param and an option hash when one is passed as parameter" do
      HTTParty.should_receive(:get).with(url, options)
      IRail::Request.get(url, options)
    end

    it "gets the body from the response" do
      response.should_receive(:body)
      IRail::Request.get(url)
    end

    it "returns the response body" do
      IRail::Request.get(url).should eql body
    end
  end
end