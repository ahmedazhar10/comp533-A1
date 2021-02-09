package woven_bankwithlogging;

@interface Log{}

/**
* Generic Logging Aspect.
*/
public aspect Logging {    

    /**
    * Logs Object creation.
    */
    after() returning (Object object): call(*.new(..)) && !within(Logging) && @annotation(Log) {
        Logger.log("Created object " + object);
    }

    /**
    * Logs Object method call.
    */
    pointcut LogMethodCall(Object object): execution(* *(..)) && target(object) && @annotation(Log);
    before(Object object) : LogMethodCall(object) {
        Object[] objects = thisJoinPoint.getArgs();
        String stringToLog = "";
        for (Object o : objects) {
            stringToLog += o.toString() + " ";
        }
        Logger.log(thisJoinPointStaticPart.getSignature().getName() + " called on object " + object + " with parameter " + stringToLog);
    }
}