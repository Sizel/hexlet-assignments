require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [status, headers, [body[0], "\n", Digest::SHA256.hexdigest(body[0])]]
  end
end
