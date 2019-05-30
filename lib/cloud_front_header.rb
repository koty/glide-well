# http://aknep.hatenablog.com/entry/2017/09/17/230405
class CloudFrontHeader
  def initialize(app)
    @app = app
  end

  def call(env)
    cf_proto = env['HTTP_CLOUDFRONT_FORWARDED_PROTO'].to_s
    if cf_proto && cf_proto.length > 0
      env['HTTP_X_FORWARDED_PROTO'] = cf_proto
    end

    @app.call(env)
  end
end
