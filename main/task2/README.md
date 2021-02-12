# Task 2
OS: MacOS X

### Locate
1. Open your terminal and navigate to the task 2 folder.  

### Config
2. Make sure that ajc is on your path by typing: export PATH=$HOME/aspectj1.9/bin/:$PATH  
3. Make sure aspectjrt is on your classpath by typing: export CLASSPATH=$HOME/aspectj1.9/lib/aspectjrt.jar:$CLASSPATH  

### Compile
4. Run the command: ajc -1.5 woven_bankwithlogging/\*.java woven_bankwithlogging/\*.aj


### Run
5. Run the command: java woven_bankwithlogging.BankWithLogging
