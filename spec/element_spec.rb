require 'spec_helper'

vcr_options = { :cassette_name => "datatxt_element", :record => :new_episodes }

describe Datatxt::Nex, vcr: vcr_options do

  before(:all) do
    Datatxt.configure do |c|
      # account: Mario Rossi <datatxt@mailinator.com>
      c.app_id = "e0bca290"
      c.app_key = "2294c676b8698383764514cc219fad92"
      c.endpoint = "https://api.dandelion.eu/datatxt/"
    end
  end
  
  it "initialize a new nex request" do
    request = Datatxt::Nex.new
    expect(request).to be_an_instance_of(Datatxt::Nex)
  end

end