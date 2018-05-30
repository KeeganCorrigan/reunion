require './lib/activity'
require './lib/reunion'
require 'erb'

erb_file = File.read("reunion_info.html.erb")
html_file = File.basename(erb_file, '.erb')

erb_str = File.read(erb_file)

@reunion = Reunion.new("Middle of Kansas").location
@activity_1 = Activity.new("Hijacking cars", 100, 70).type
@activity_2 = Activity.new("Speedboat jousting", 50, 70).type

renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end
