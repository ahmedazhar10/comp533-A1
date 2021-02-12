
public class HelloWorld {

	public static void main(String[] args) {
		World this_world = new World("Earth");
		String world_name = this_world.getName(true);
		System.out.println("People of the world, " + world_name + ", say Hello!");
	}	
}

class World {
    
    protected String name;
    
    @Log
    public World(String givenName) {
        this.name = givenName;
    }

    @Log
    public String getName(boolean caps) {
	    if (caps) return this.name.toUpperCase();
        else return this.name;
    }

    public String toString() {
        return this.name;
    }
}