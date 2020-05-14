import java.util.*;

/*
 *
 *  로또 번호를 만드는 예제 입니다.
 */
public class HashSetLotto {

    public static void main(String[] args) {
        Set set = new HashSet();

        for(int i = 0; set.size() < 6; i++){

            int num = (int)(Math.random()*45) + 1;
            set.add(new Integer(num));

        }

        List list = new LinkedList(set);
        Collections.sort(list);
        System.out.println(list);
    }

}
