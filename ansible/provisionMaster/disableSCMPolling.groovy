import hudson.model.*


disableChildren(Hudson.instance.items)

def disableChildren(items) {
  println "------------------------------------> disalbe items ........  "
  for (item in items) {


try{
    if (item.class.canonicalName == 'com.cloudbees.hudson.plugins.folder.Folder') {
        disableChildren(((com.cloudbees.hudson.plugins.folder.Folder) item).getItems())
    } else {
      
      
      
      try{
      println "-xx-----------------------------------> disalbe item ........  ${item}"
      item.setTriggers(new java.util.ArrayList<hudson.triggers.Trigger>())
      item.save()
      println(item.name)
      }catch(Exception e){
        println "--- couldn't set empty trigger, try disabling "+e.getMessage();
	
	item.disable();
	item.save();
      }

    }
}catch(Throwable t){
      println "------------------------------------> failed to do disable on item........  ${item} " + t
	
}
  }
}

