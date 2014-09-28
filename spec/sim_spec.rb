require 'spec_helper'

vcr_options = { :cassette_name => "datatxt_sim", :record => :new_episodes }

describe Datatxt::Nex, vcr: vcr_options do

  before(:each) do
    Datatxt.configure do |c|
      # account: Mario Rossi <datatxt@mailinator.com>
      c.app_id = "e0bca290"
      c.app_key = "2294c676b8698383764514cc219fad92"
      c.endpoint = "https://api.dandelion.eu/"
    end
  end
  
  it "initialize a new sim request" do
    request = Datatxt::Sim.new
    expect(request).to be_an_instance_of(Datatxt::Sim)
  end

  it "make a request to sim using two italian plain texts" do
    element = Datatxt::Sim.new
    response = element.analyze(
      text1: "Mio padre che mi spinge a mangiare e guai se non finisco mio padre che vuol farmi guidare mi frena con il fischio il bambino più grande mi mena davanti a tutti gli altri lui che passa per caso mi salva e mi condanna per sempre",
      text2: "Mio padre di spalle sul piatto si mangia la vita e poi sulla pista da ballo fa un valzer dentro il suo nuovo vestito"
    )
    expect(response).not_to be_empty
    expect(response["lang"]).to eq("it")
    expect(response["similarity"]).not_to be_nil
  end

  it "raise exception on wrong config parameters" do
    Datatxt.configure do |c|
      c.app_id = "bad-app-id"
      c.app_key = "bad-app-key"
      c.endpoint = "not-an-url-endpoint"
    end
    element = Datatxt::Sim.new
    expect { element.analyze(text: "test") }.to raise_error(Datatxt::BadResponse)
  end


end