
public class Ex_02 {

    public static void main(String[] args) {

        System.out.println("키 와 몸무게를 입력하세요.");

        String[] str = new String[5];
        for(int i = 0; i < args.length; i++){
            str[i] = args[i];
        }

        Hyunsoo hs = new Hyunsoo();
            hs.setHeight(str[0]);
            hs.setWeight(str[1]);


        System.out.println(hs.getHeight());
        System.out.println(hs.getWeight());
//        if(args.length < 3)
//            System.out.println("입력값을 3개 이상 입력하세요.");
//        else{
//            for(int i = 0; i < args.length; i++)
//                System.out.println(args[i]);
//        }


    }
}
