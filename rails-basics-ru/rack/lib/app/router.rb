require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/'      then [200, {}, ['Hello, World!']]
    when '/about' then [200, {}, ['About page']]
    else               [404, {}, ['404 Not Found']]
    end
  end
end
