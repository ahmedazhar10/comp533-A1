# Task 4
OS: MacOS X

### Demonstrate
To demonstrate the resue of the logging module  
The Logger.aj file from task3 is added to task4  
And it is being called from the main Java class file - HelloWorld.java

### Locate
1. Open your terminal and navigate to the project folder.  
2. Go to the folder "task4".

### Config
3. Make sure that ajc is on your path by typing: export PATH=$HOME/aspectj1.9/bin/:$PATH  
4. MAke sure aspectjrt is on your classpath by typing: export CLASSPATH=$HOME/aspectj1.9/lib/aspectjrt.jar:$CLASSPATH  

### Compile
5. Run the command: ajc -1.5 task4/*.java task4/*.aj  

### Run
6. Run the command: java task4.HelloWorld  
