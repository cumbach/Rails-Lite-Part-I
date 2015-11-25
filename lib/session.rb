require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req

    if @req.cookies['_rails_lite_app']
      @store = JSON.parse(@req.cookies['_rails_lite_app'])
    else
      @store = {}
    end
  end

  def [](key)
    @store[key]
  end

  def []=(key, val)
    @store[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', {path: "/", value: @store.to_json})
  end


end
