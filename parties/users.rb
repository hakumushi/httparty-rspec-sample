require 'httparty'

class Users
  include HTTParty
  base_uri 'http://localhost:3000'

  def self.login(email, password)
    json = { body: { email:email, password: password} }
    return self.post('/login', json)
  end

  def self.get_cookie(response)
    return { 'Authorization' => 'JWT ' + response.headers['set-cookie'].split[0][6..-2] }
  end

  def self.get_users(cookie=nil)
    if(cookie.nil?)
      return self.get('/users')
    end
    return self.get('/users', :headers=>cookie)
  end

end