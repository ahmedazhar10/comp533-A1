package woven_bankwithlogging;

// Start of user code for imports
// End of user code

/**
 * Account class definition.
 * Generated by the TouchCORE code generator.
 */
public class Account {
    
    protected int balanceInCents;
    protected int accountNumber;
    protected Customer owner;
    
    @Log
    public Account(int initialBalance, Customer owner) {
        this.balanceInCents = initialBalance;
        this.owner = owner;
        this.accountNumber = (int) (Math.random() * 1000000);
        //String stringToLog = "Created object " + this;
        //Logger.log(stringToLog);
    }

    @Log
    public void deposit(int amount) {
        //String stringToLog = "deposit called on object " + this + " with parameter " + amount;
        //Logger.log(stringToLog);
        this.balanceInCents = balanceInCents + amount;
    }

    @Log
    public void withdraw(int amount) {
        //String stringToLog = "withdraw called on object " + this + " with parameter " + amount;
        //Logger.log(stringToLog);
        if (balanceInCents >= amount) {
            this.balanceInCents = balanceInCents - amount;
        } else {
            NotEnoughtFundsException nefException = new NotEnoughtFundsException();
            throw nefException;
        }
    }

    Customer getOwner() {
        return this.owner;
    }

    boolean setOwner(Customer newObject) {
        this.owner = newObject;
        return true;
    }

    public String toString() {
        String returnedString = "Account " + accountNumber + " of " + owner.getName() + ": " + balanceInCents;
        return returnedString;
    }
}