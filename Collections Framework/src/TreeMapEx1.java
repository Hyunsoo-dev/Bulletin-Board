

public class TreeMapEx1 {

    public static void main(String[] args) {

    }

    public static String printBar(char ch , int value){

        char[] bar = new char[ value ];

        for(int i = 0; i < bar.length; i++){
            bar[i] = ch;
        }

        return new String(bar);
    }
}


