Task 2

OS: MacOS

1. Open your terminal and navigate to the project folder.  
2. Go to the folder "Task2".  
3. Make sure that ajc is on your path by typing: export PATH=$HOME/aspectj1.9/bin/:$PATH  
4. MAke sure aspectjrt is on your classpath by typing: export CLASSPATH=$HOME/aspectj1.9/lib/aspectjrt.jar:$CLASSPATH  
5. Run the command: ajc -1.5 woven_bankwithlogging/*.java woven_bankwithlogging/*.aj  
6. Run the command: java woven_bankwithlogging.BankWithLogging  