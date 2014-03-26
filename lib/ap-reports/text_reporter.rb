require 'liquid'

@template = Liquid::Template.parse("{% for r in requests %}")
@template.render('requests' => )
