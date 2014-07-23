require "snom/errors"
require "snom/version"
require "xmlrpc/client"

class Snom
  def initialize(username='', password='')
    if username.to_s == ''
      raise Snom::ArgumentError, "A username must be provided to Snom#new"
    end

    if password.to_s == ''
      raise Snom::ArgumentError, "A password must be provided to Snom#new"
    end

    @username = username
    @password = password

    setup_connection
  end

  def check_device(mac_address='')
    @connection.call("redirect.checkPhone", mac_address)
  end


private

  def setup_connection
    @connection = XMLRPC::Client.new3({
      :host     => "provisioning.snom.com",
      :path     => "/xmlrpc",
      :port     => "8083",
      :use_ssl  => "true",
      :user     => @username,
      :password => @password,
    })
  end
end
