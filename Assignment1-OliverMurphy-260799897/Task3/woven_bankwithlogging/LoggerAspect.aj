package woven_bankwithlogging;

import org.aspectj.lang.JoinPoint;

//Task 3 -> slide 57

public abstract aspect LoggerAspect {
	
	//The pointcut for set 1. To be defined in the specified composition
	public abstract pointcut pointcutSet1(Object owner); 
	
	//The logging function related to set 1. To be specified in the composition
	public abstract void loggingSet1(JoinPoint joinPoint);
	
	//Advice for set 1
	after(Object owner) : pointcutSet1(owner)
	{
		loggingSet1(thisJoinPoint);
	}
	
	//The pointcut for set 2. To be defined in the specified composition
	public abstract pointcut pointcutSet2(Object owner);
	
	//Logging function for set 2. Define it in the composition
	public abstract void loggingSet2(JoinPoint joinPoint);

	//Advice for set 2
	before(Object owner) : pointcutSet2(owner)
	{
		loggingSet2(thisJoinPoint);
	}
}
