require 'spec_helper'

vcr_options = { :cassette_name => "datatxt_element", :record => :new_episodes }

describe Datatxt::Nex, vcr: vcr_options do

  before(:all) do
    Datatxt.configure do |c|
      c.app_id = ""
      c.app_key = ""
      c.endpoint = "https://api.dandelion.eu/datatxt/"
    end
  end
  
  it "initialize a new nex request" do
    request = Datatxt::Nex.new
    expect(request).to be_an_instance_of(Datatxt::Nex)
  end

end