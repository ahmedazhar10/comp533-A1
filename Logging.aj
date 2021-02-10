package woven_bankwithlogging;

public aspect Logging {
	
	// Log constructor when instantiating Account object
    after() : initialization(Account.new(..)) {
        String stringToLog = "Created object " + thisJoinPoint.getArgs()[1];
        Logger.log(stringToLog);
    }
    
    // Log constructor when instantiating Customer object
    after() : initialization(Customer.new(..)) {
        String stringToLog = "Created object " + thisJoinPoint.getArgs()[0];
        Logger.log(stringToLog);
    }
	
	// Log deposit method from Account class
	after(Account acct) : (call (public * Account.deposit(..)) && target(acct)) {
		String stringToLog = "deposit called on object " + acct.owner.getName() + " with parameter " + thisJoinPoint.getArgs()[0];
		Logger.log(stringToLog);
	}
	
	// Log withdraw method from Account class
	after(Account acct) : (call (public * Account.withdraw(..)) && target(acct)) {
		String stringToLog = "withdraw called on object " + acct.owner.getName() + " with parameter " + thisJoinPoint.getArgs()[0];
		Logger.log(stringToLog);
	}
	
}
