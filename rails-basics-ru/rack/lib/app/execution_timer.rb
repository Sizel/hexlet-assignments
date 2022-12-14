class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    time_before = Time.now
    status, headers, body = @app.call(env)
    time_after = Time.now
    body << "\n #{time_after - time_before}"

    [status, headers, body]
  end
end
