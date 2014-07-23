require 'spec_helper'

describe Snom do
  describe "#new" do
    it "returns an instance of Snom" do
      snom = Snom.new('username', 'password')

      snom.should be_an_instance_of Snom
    end

    it "raises an exception if a username isn't supplied" do
      expect {
        Snom.new(nil, 'password')
      }.to raise_error(
        Snom::ArgumentError,
        "A username must be provided to Snom#new")
    end

    it "raises an exception if a password isn't supplied" do
      expect {
        Snom.new('username', nil)
      }.to raise_error(
        Snom::ArgumentError,
        "A password must be provided to Snom#new")
    end
  end

  describe "#check_device" do
    it "raises an exception if a mac address isn't supplied"

    context "when a valid mac address is supplied" do
      it "sends the 'redirect.checkPhone' message to snom's servers" do
        stub_request(
          :post,
          "https://username:password@provisioning.snom.com:8083/xmlrpc"
        ).with(
          :body    => "<?xml version=\"1.0\" ?><methodCall><methodName>redirect.checkPhone</methodName><params><param><value><string>foo</string></value></param></params></methodCall>\n",
          :headers => {
            'Accept'          => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Connection'      => 'keep-alive',
            'Content-Length'  => '159',
            'Content-Type'    => 'text/xml; charset=utf-8',
            'User-Agent'      => 'XMLRPC::Client (Ruby 2.1.2)'
          }
        ).to_return(
          :status  => 200,
          :body    => "<?xml version='1.0'?><methodResponse><params><param><value><array><data><value><boolean>1</boolean></value><value><string>Ok</string></value></data></array></value></param></params></methodResponse>",
          :headers => {}
        )

        snom = Snom.new('username', 'password')
        snom.check_device('foo')
      end
    end

    context "when the supplied mac address is malformed" do
      it "raises the 'The mac address is malformed'"
    end

    context "when the supplied mac address is registered to another user" do
      it "raises the 'The mac address is registered to another user'"
    end
  end
end
