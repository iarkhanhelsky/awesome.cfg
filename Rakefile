require 'bundler/setup'
require 'grably'

require_relative 'build'

SVG_SOLID = File.join(__dir__, 'Font-Awesome', 'svgs', 'solid')

task :default => :assets

task :assets => :icons do |t|
  t.sync({ :task_deps => '**/*battery-*.png' }, 'assets/icons/battery')
end

task :icons => %[battery_icon] do |t|
  opts = [
    %w[-background none], # transparent background
    ['-fill', 'rgb(255, 255, 255)'], # fill with white
    ['-opaque', 'rgb(0, 0, 0)'], # color to replace
    ['-fuzz', '85%']
  ]
  t << t.svg_convert(srcs: :task_deps, format: 'png', opts: opts)
end

task :battery_icon do |t|
  LEVELS = 100
  # Width of inner battery fill
  WIDTH = 416
  # Make template out of svg path
  BATTERY_INNER = %w[96H96v128h416V192z 96H96v128h%dV192z]
  # Take battery-full.svg, and generate battery icon for all levels. We need to
  # find path description string
  battery_full = IO.read(File.join(SVG_SOLID, 'battery-full.svg'))
  battery_template = battery_full.sub(*BATTERY_INNER)
  raise 'Svg path doesn\'t match' if battery_full == battery_template

  # 0..100
  (LEVELS + 1).times do |i|
    width = WIDTH.to_f / LEVELS * i
    percents = (width / WIDTH.to_f * 100).to_i
    t << t.text(content: battery_template.format(width),
                filename: "battery-#{percents}.svg")
  end
end
