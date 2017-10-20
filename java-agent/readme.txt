Run the build.xml with the default target.
or
Export patching.jar from agent project. Add that jar to the class path of agent-test project
Run the class com.mycom.sample.agent.Server with the below VM options 
-javaagent:patching.jar -Dpatch.classpath=file:///<work-space>/java-agent/agent/bin/ 
patch.classpath would be the path where the new class file put up.