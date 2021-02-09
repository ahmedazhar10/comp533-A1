public aspect LoggingAspect {
	
	after(int i, Object obj) : call(void *.*(int)) && args(i) && target(obj) {
    	BankSpecification bankSpec = new BankSpecification();
    	if (bankSpec.bankSpecs.contains(obj.toString().split(" ")[0])) {
    		Logger.log(thisJoinPoint.getSignature().getName() + " called on object " + obj.toString() + " with parameter " + i);
    	}
    }
	
	after(Object obj1, int i, Object obj2) returning :
    	execution(*+.new(..)) && args(i, obj2) && target(obj1) {
    	BankSpecification bankSpec = new BankSpecification();
    	if (bankSpec.bankSpecs.contains(obj1.toString().split(" ")[0])) {
    		Logger.log("Created object " + obj1.toString());
    	}
    }
    
    after(Object obj, String str) returning :
    	execution(*+.new(..)) && args(str) && target(obj) {
    	BankSpecification bankSpec = new BankSpecification();
    	if (bankSpec.bankSpecs.contains(obj.toString().split(" ")[0])) {
    		Logger.log("Created object " + obj.toString());
    	}
    }
}