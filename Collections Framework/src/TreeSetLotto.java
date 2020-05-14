import java.util.Set;
import java.util.TreeSet;


/*
 * TreeSet 을 이용하여 난수들을 저장하는 예제이다.
 */
public class TreeSetLotto {

    public static void main(String[] args) {
        Set set = new TreeSet();

        for(int i = 0; set.size() < 6; i++){
            int num = (int)(Math.random() * 45) + 1;
            set.add(num);
        }

        System.out.println(set);
    }
}
