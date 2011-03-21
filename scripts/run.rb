require 'vizkit'

#try to load widget
widget = Vizkit.default_loader.ClassName
widget.show
widget.setText("ClassName: Hello Rock")
Vizkit.exec
