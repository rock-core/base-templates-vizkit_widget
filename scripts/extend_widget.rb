#extend the c++ widget ClassName with ruby methods
Vizkit::UiLoader::extend_cplusplus_widget_class "ClassName" do

  #test method
  #you can delete it 
  def ruby_method()
    setText("Hello Rock")
  end

#callback function to display a sample
#  def update(sample,port_name)
#    puts "got new sample"
#  end

end

#If you want to use the widget to display samples add the following line 
#and replace /base/samples/frame/Frame with the sample type you want to display. 
#After that you can call Viszkit.display task.port to display output ports those
#samples types are of that type.
#Vizkit::UiLoader.register_widget_for("ClassName","/base/samples/frame/Frame",:update)
