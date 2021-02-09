Inside Task 3\src:

To compile, use
ajc -1.5 -classpath=C:\aspectj1.9\lib\aspectjrt.jar woven_bankwithlogging/*.java woven_bankwithlogging/*.aj

To run the program, use
java -cp .;C:\aspectj1.9\lib\aspectjrt.jar woven_bankwithlogging.BankWithLogging

To use reusable logging module and customize to your needs, simply add the @Log annotation to any object constructor or method you would like to log.