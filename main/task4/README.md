# Task 4
OS: MacOS X

### Demonstration
To demonstrate the reuse of the logging module  
The Logger.aj file from task3 is added to task4  
And it is being called from the main Java class file - HelloWorld.java

### Locate
1. Open your terminal and navigate to the task 4 folder.  

### Config
2. Make sure that ajc is on your path by typing: export PATH=$HOME/aspectj1.9/bin/:$PATH  
3. Make sure aspectjrt is on your classpath by typing: export CLASSPATH=$HOME/aspectj1.9/lib/aspectjrt.jar:$CLASSPATH  

### Compile
4. Run the command: ajc -1.5 \*.java \*.aj

### Run
5. Run the command: java HelloWorld  
