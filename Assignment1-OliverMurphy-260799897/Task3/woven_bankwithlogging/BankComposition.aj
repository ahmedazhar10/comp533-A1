package woven_bankwithlogging;

import org.aspectj.lang.JoinPoint;

public aspect BankComposition extends LoggerAspect {
	
	//Pointcut for set 1 => constructors
	public pointcut pointcutSet1(Object owner) : 
		(initialization(woven_bankwithlogging.Customer.new(..)) && target(owner)) 
		||
		(initialization(woven_bankwithlogging.Account.new(..)) && target(owner)) ;
	
	//Define what we are logging for set 1
	public void loggingSet1(JoinPoint joinPoint)
	{
		System.out.println("Created object " + joinPoint.getTarget().toString());
	}
	
	//Define pointcut for set 1 => deposits/withdraws
	public pointcut pointcutSet2(Object owner) : call(* woven_bankwithlogging.Account.*(..)) && target(owner); 
	
	//Log withdraw/deposit, account and amount
	public void loggingSet2(JoinPoint joinPoint)
	{	
		String logToString = joinPoint.getSignature().getName() + " called on object " + 
				joinPoint.getTarget().toString() + " with parameter " + joinPoint.getArgs()[0];
																		//only have 1 argument and its the amount
		System.out.println(logToString);
	}
	
}
