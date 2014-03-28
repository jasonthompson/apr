require 'sequel' 
require 'liquid'
require_relative '../config.rb'
require_relative '../lib/ap-reports/request.rb'

res = Request.where(:datefinish => nil).all
template = ""

File.open('templates/contentious-report.tex') do |f|
  template << f.read
end

@template = Liquid::Template.parse(template)

puts @template.render('requests' => res )
