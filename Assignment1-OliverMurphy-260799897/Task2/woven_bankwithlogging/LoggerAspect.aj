package woven_bankwithlogging;

public aspect LoggerAspect {
	
	//Customer
	pointcut customerConstructor(String name, Customer currentCustomer) :
		initialization(woven_bankwithlogging.Customer.new(..)) && args(name) && target(currentCustomer);
	
	after(String name, Customer currentCustomer) : customerConstructor(name, currentCustomer) {
		String stringToLog = "Created object " + currentCustomer;
		System.out.println(stringToLog);
	}
	
	//Account
	pointcut accountConstructor(int initialBalance, Customer owner, Account currentAccount) :
		initialization(woven_bankwithlogging.Account.new(..)) && args(initialBalance, owner) && target(currentAccount);
	
	after(int initialBalance, Customer owner, Account currentAccount) : accountConstructor(initialBalance, owner, currentAccount) {
		String stringToLog = "Created object " + currentAccount;
		System.out.println(stringToLog);
	}
	
	pointcut callWithdraw(Account currentAccount, int amount) :
		call(void woven_bankwithlogging.Account.withdraw(..)) && args(amount) && target(currentAccount);
		
	
	before(Account currentAccount, int amount) : callWithdraw(currentAccount, amount) {
		String stringToLog = "withdraw called on object " + currentAccount + " with parameter " + amount;
		System.out.println(stringToLog);
	}
	
	pointcut callDeposit(Account currentAccount, int amount) :
		call(void woven_bankwithlogging.Account.deposit(..)) && args(amount) && target(currentAccount);
		
	
	before(Account currentAccount, int amount) : callDeposit(currentAccount, amount) {
		String stringToLog = "deposit called on object " + currentAccount + " with parameter " + amount;
		System.out.println(stringToLog);
	}

		
}
