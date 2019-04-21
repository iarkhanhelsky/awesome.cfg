require 'digest'

module Grably
  class SvgConvert
    include Grably::Job

    srcs :srcs
    opt :format
    opt :opts

    def build
      srcs.map do |f|
        dst = f.dst.sub(/\.svg$/, ".#{format.downcase}")
        out = File.join(job_path(::Digest::MD5.hexdigest(f.src)), dst)

        FileUtils.mkdir_p(File.dirname(out))

        cmd = [].tap do |c|
          c << 'convert'
          c << opts
          c << f.src
          c << out
        end

        cmd.run

        Product.new(out, dst)
      end
    end
  end
end
