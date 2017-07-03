class LogonPixel

  def initialize(app)
    @app = app
  end
  
  def call(env)
    dup._call(env)
  end

  def _call(env)
    #require 'pry'; binding.pry

    if env.fetch('PATH_INFO') =~ /^\/slp\/(.+)\.png/
      Rails.logger.send(:info, "MIDDLEWARE FOR PNG")
      [ 200, { 'Content-Type' => 'image/png' }, [ File.read(File.join(File.dirname(__FILE__), 'slp.png')) ] ]
    else
      Rails.logger.send(:info, "MIDDLEWARE FOR APP")
      # @status, @headers, @response = @app.call(env)
      # [@status, @headers, @response]
      @app.call(env)
    end
  end

end
