public aspect CustomerAspect {
	
    after(Customer cus, String name) returning :
    	execution(Customer+.new(String)) && args(name) && target(cus) {
        String stringToLog = "Created object " + cus.name;
        Logger.log(stringToLog);
    }

}
