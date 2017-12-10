package discretemath;

/**
 *
 * @author Admin
 */
public class Ex10Page361 {
    public static int test = 1;
    public static void listDifferentOrder(String prefix, String s) {
        int n = s.length();
        if (n == 0){
            System.out.println(prefix + "---" + test);
            test++;
        }
            
        else {
            for (int i = 0; i < n; i++)
                listDifferentOrder(prefix + s.charAt(i), s.substring(0, i) + s.substring(i+1, n));
        }
    }
    
    public static void listDifferentOrder(String s) {
        listDifferentOrder("", s); 
    }
    
    public static int fac(int n) {
        if (n == 0 || n == 1) return 1;
        else return (n*fac(n-1));
    }

    public static void main(String[] args) {
        
        int n = 6; //The total number of candidates 
        System.out.println("The total number of different orders: " + fac(n));
        System.out.println("Here is the list of " + fac(n) + " different orders");
        String nameOfCandidates = "ABCDEF"; //A,B,C,D,E,F are stand for the name of six candidates (or more)
        String elements = nameOfCandidates.substring(0, n);
        listDifferentOrder(elements);
    }
}
