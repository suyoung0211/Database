package app;

import dao.TblCustomerDao;
import vo.CustomerVo;

public class CustomerManageApp {

  public static void main(String[] args) {
    System.out.println("========= 고객 관리 App ==========");
    boolean run = true;
    while (run) {
      System.out.println("선택 메뉴 : 1. 고객 등록   2. 고객 정보 조회");
      System.out.println("           3. 고객 이메일");
      String menu = System.console().readLine("메뉴 선택 >>>> ");
      switch (menu) {
        case "1":
          register();
          break;
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
    boolean run = true;
    TblCustomerDao dao = new TblCustomerDao();
    String customerId = null;
    while (run) {
      customerId = System.console().readLine("사용할 아이디 >>> ");
      // customerId는 PK - 중복 검사 필요
      if (dao.selectByPk(customerId) != null) {
        System.out.println("이미 사용중인 고객 아이디 입니다.");
        continue; // 다시 반복 처음으로
      } else
        run = false;
    }
    String name = System.console().readLine("성명 >>> ");
    String email = System.console().readLine("이메일 >>> ");

    int age = 0;
    run = true;
    while (run) {
      String temp = System.console().readLine("나이(미입력은 엔터) >>> ");
      if (temp.length() == 0)
        break;
      try {
        age = Integer.parseInt(temp);
        if (age < 0 || age > 100) {
          // 강제로 예외 발생
          throw new Exception("나이 값은 0~100 입니다.");
        } else {
          run = false;
        }
      } catch (NumberFormatException e) {
        System.out.println("나이는 숫자만 입력하세요.");
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
    }
    // 예외 처리 NumberFormatException 필요 -> 나이 입력 부분만 while 로.
    // 🔥 dao 의 insert 실행
    CustomerVo vo = new CustomerVo(customerId, name, email, age, null);
    if (dao.insert(vo) == 0)
      System.out.println("고객 등록 실패!!!");
    else
      System.out.println("고객 등록 완료!!");
  }

  // 고객 조회
  private static void printInfo() {
    System.out.println("\t :: 고객 정보 조회 ::");
    String customerid = System.console().readLine("아이디 입력 >>> ");
    TblCustomerDao dao = new TblCustomerDao();
    CustomerVo customer = dao.selectByPk(customerid); // select 결과를 Vo 객체로 리턴
    System.out.println("[이름] " + customer.getAge());
    System.out.println("[이메일] " + customer.getEmail());
    System.out.println("[나이] " + (customer.getAge() == 0? "미입력" : customer.getAge()));
    System.out.println("[가입일자] " + customer.getRegDate());
  }
}
