require 'vizkit'
require File.join(File.dirname(__FILE__),'extend_widget')

#try to load widget
widget = Vizkit.default_loader.ClassName
widget.show
widget.ruby_method
Vizkit.exec
