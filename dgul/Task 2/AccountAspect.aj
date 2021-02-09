public aspect AccountAspect {
	
    after(Account acc, int balance, Customer owner) returning :
    	execution(Account+.new(int, Customer)) && args(balance, owner) && target(acc) {
        String stringToLog = "Created object " + acc.accountNumber + " of " + owner + ": " + acc.balanceInCents;
        Logger.log(stringToLog);
    }
    
	pointcut withdraw(int amount, Account acc) :
    	call(void Account.withdraw(int)) && args(amount) && target(acc);
	
    after(int amount, Account acc) : withdraw(amount, acc) {
        String stringToLog = "withdraw called on object " + acc.accountNumber + " with parameter " + amount;
        Logger.log(stringToLog);
    }
    
    pointcut deposit(int amount, Account acc) :
    	call(void Account.deposit(int)) && args(amount) && target(acc);
    
    after(int amount, Account acc) : deposit(amount, acc) {
        String stringToLog = "deposit called on object " + acc.accountNumber + " with parameter " + amount;
        Logger.log(stringToLog);
    }
}