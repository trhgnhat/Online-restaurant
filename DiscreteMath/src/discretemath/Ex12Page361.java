/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package discretemath;

/**
 *
 * @author Admin
 */
public class Ex12Page361 {

    public int factorial(int n) {
        if (n == 0 || n == 1) {
            return 1;
        }
        return n * factorial(n - 1);
    }

    public int combination(int n, int k) {
        return factorial(n) / (factorial(n - k) * factorial(k));
    }

    public int sumOfCombination(int from, int to, int n) {
        if (from == to) {
            return combination(n, from);
        }
        return combination(n, from) + sumOfCombination(from + 1, to, n);
    }

    public static void printBin(String soFar, int iterations) {
        if (iterations == 0) {
            System.out.println(soFar);
        } else {
            printBin(soFar + "0", iterations - 1);
            printBin(soFar + "1", iterations - 1);
        }
    }

    static void printB(int lengthOfString, int numberOf1s) {
        String B; 
        for (int i = 0; i < Math.pow(2, lengthOfString); i++) {
            B = "";
            int temp = i;
            for (int j = 0; j < lengthOfString; j++) {
                if (temp % 2 == 1) {
                    B = '1' + B;
                } else {
                    B = '0' + B;
                }
                temp = temp / 2;
            }
            String[] a;
            a = B.split("(?!^)");
            int count1 = 0;
            for (int j = 0; j < a.length; j++) {
                if (a[j].equals("1")) {
                    count1++;
                }
            }
            if (count1 == numberOf1s) {
                System.out.println(B);              
            }

        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("Number of bit string of length 12 contain EXACTLY THREE 1s: 12C3 = "
                + String.valueOf(new Ex12Page361().combination(12, 3)));
        printB(12, 3);
        System.out.println("Number of bit string of length 12 contain AT MOST THREE 1s: 12C3 + 12C2 + 12C1 + 12C0 = "
                + String.valueOf(new Ex12Page361().sumOfCombination(0, 3, 12)));
        for (int i = 0; i <= 3; i++) {
            printB(12, i);
        }
        System.out.println("Number of bit string of length 12 contain AT LEAST THREE 1s: 12C3 + 12C4 + 12C5 + 12C6 + 12C7 + 12C8 + 12C9 + 12C10 + 12C11 + 12C12 = "
                + String.valueOf(new Ex12Page361().sumOfCombination(3, 12, 12)));
        for (int i = 3; i <= 12; i++) {
            printB(12, i);
        }
        System.out.println("Number of bit string of length 12 contain AN EQUAL NUMBER OF 0s and 1s: 12C6 = "
                + String.valueOf(new Ex12Page361().combination(12, 6)));
        printB(12, 6);
    }

}
