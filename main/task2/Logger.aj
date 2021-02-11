package woven_bankwithlogging;

public aspect Logger {
	
    public static void log(String message) {
        System.out.println(message);
    }

    // log account created
    after() returning (Account this_account): call(Account.new(..)) {
        String stringToLog = "Created object " + this_account;
        Logger.log(stringToLog);
    }
    
    // log  customer created
    after() returning (Customer this_customer): call(Customer.new(..)) {
        String stringToLog = "Created object " + this_customer;
        Logger.log(stringToLog);
    }

    // log withdrawal made
    pointcut withdrawCall(int amount, Account this_account) : call(public * Account.withdraw(int)) && args(amount) && target(this_account);
    after(int amount, Account this_account) : withdrawCall(amount, this_account) {
        String stringToLog = "withdraw called on object " + this_account + " with parameter "  + amount;
        Logger.log(stringToLog);
    }
    
    // log deposit made
    pointcut depositCall(int amount, Account this_account) : call(public * Account.deposit(int)) && args(amount) && target(this_account);
    after(int amount, Account this_account) : depositCall(amount, this_account) {
        String stringToLog = "deposit called on object " + this_account + " with parameter " + amount;
        Logger.log(stringToLog);
    }

}