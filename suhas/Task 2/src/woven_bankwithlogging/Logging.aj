package woven_bankwithlogging;

/**
* Logging Aspect.
*/
public aspect Logging {    

    /**
    * Logs Account creation.
    */
    after() returning (Account account): call(Account.new(..)) {
        Logger.log("Created object " + account);
    }

    /**
    * Logs Account deposit.
    */
    pointcut LogDeposit(int amount, Account account) : call(public * Account.deposit(int)) && args(amount) && target(account);
    before(int amount, Account account) : LogDeposit(amount, account) {
        Logger.log("deposit called on object " + account + " with parameter " + amount);
    }

    /**
    * Logs Account withdrawal.
    */
    pointcut LogWithdraw(int amount, Account account) : call(public * Account.withdraw(int)) && args(amount) && target(account);
    before(int amount, Account account) : LogWithdraw(amount, account) {
        Logger.log("withdraw called on object " + account + " with parameter " + amount);
    }

    /**
    * Logs Customer creation.
    */
    after() returning (Customer customer): call(Customer.new(..)) {
        Logger.log("Created object " + customer);
    }
}