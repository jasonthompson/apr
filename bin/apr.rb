require 'sequel' 
require 'liquid'
require_relative '../config.rb'
require_relative '../lib/ap-reports/request.rb'

res = Request.where(:datefinish => nil).all

@template = Liquid::Template.parse("{% for r in requests %} {{r.file_number}}: {{r.date_created}}\n {% endfor %}")

puts @template.render('requests' => res )
