

@interface Log{}


public aspect Logger {
	
    public static void log(String message) {
        System.out.println(message);
    }

    // Log object creation
    after() returning (Object object): call(*.new(..)) && @annotation(Log) {
        String stringToLog = "Created object " + object;
        Logger.log(stringToLog);
    }
    
    // Log method calls
    pointcut methodCall(Object object): execution(* *(..)) && @annotation(Log) && target(object);
    after(Object object) : methodCall(object) {
    	String arguments = "";
        Object[] object_args = thisJoinPoint.getArgs(); 
        for (Object argument : object_args) { arguments += argument.toString() + " ";}
        System.out.println("Method " + thisJoinPointStaticPart.getSignature() + " was called on Object: " + object + " with Arguments: " + arguments);
    }

}
