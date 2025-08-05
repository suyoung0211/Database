package app;

import dao.TblCustomerDao;
import vo.CustomerVo;

public class MyCustomerMangerApp {
    public static void main(String[] args) {
        System.out.println("====== 고객 관래 App ======");
        boolean run = true;
        while (run) {
            System.out.println(" 선택 메뉴 : 1. 고객 등록    2. 고객 정보 조회");
            String menu = System.console().readLine("메뉴 선택 >>> ");
            switch (menu) {
                case "1":
                    register();
                case "2":
                    printInfo();
                    break;

                default:
                    System.out.println("없는 메뉴 입니다.");
                    break;
            }
        }
    }

    // 고객 등록
    private static void register() {
        System.out.println("\t :: 고객 등록 ::");
        TblCustomerDao dao = new TblCustomerDao();
        String customerId = null;
        int age = 0;
        boolean run = true;
        while (run) {
            customerId = System.console().readLine("사용할 아이디 >>> ");
            // customerId 는 PK - 중복 검사 필요
            if (dao.selectByPk(customerId) != null) {
                System.out.println("이미 사용중인 고객 아이디 입니다.");
                continue; // 다시 반복 처음으로
            } else {
                run = false;
            }
        }
        String name = System.console().readLine("성명 >>> ");
        String email = System.console().readLine("이메일 >>> ");

        run = true;
        // 예외 처리 NumberFormatException 필요 -> 나이 입력 부분만 while 로
        while (run) {
            String temp = System.console().readLine("나이 >>> ");
            try {
                age = Integer.parseInt(temp);

            } catch (NumberFormatException e) {
                System.out.println("숫자만 입력 해주세요.");
                continue;
            }
            run = false;
        }

        // dao 의 insert 실행
        CustomerVo vo = new CustomerVo(customerId, name, email, age, null);

        if (dao.insert(vo) == 0) {
            System.out.println("고객 등록 실패 !!");
        } else {
            System.out.println("고객 등록 완료 !!");
        }
    }

    // 고객 조회
    private static void printInfo() {
        System.out.println("\t :: 고객 정보 조회 ::");
        String customerid = System.console().readLine("아이디 입력 >>> ");
        TblCustomerDao dao = new TblCustomerDao();
        CustomerVo customer = dao.selectByPk(customerid); // select 결과를 Vo 객체로 리턴
        System.out.println("[이름] " + customer.getAge());
        System.out.println("[이메일] " + customer.getEmail());
        System.out.println("[나이] " + customer.getAge());
        System.out.println("[가입일자] " + customer.getRegDate());
    }
}
