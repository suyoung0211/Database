package dbcp.test;

import java.sql.Connection;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dao.TblProductDao;
import dbcp.DBCPTBLProductDao;
import dbcp.DBConnectionPool;
import util.OracleConnection;
import vo.ProductVo;

public class ConnectionPerformanceTest {

  public static void main(String[] args) {
    ExecutorService executor = Executors.newFixedThreadPool(10);
    // TblProductDao dao = new TblProductDao(); // 1) 직접 연결 방식 dao
    DBCPTBLProductDao dao = new DBCPTBLProductDao(); // 2) DBCP 방식 dao
    for (int i = 0; i < 50; i++) {
      // 스레드가 동작할 내용을 람다식으로 submit 메소드에 작성
      executor.submit(() -> {
        long connStart = System.currentTimeMillis();

        // DBCP 는 5 ~ 10 개 size

        try {
          long connEnd = System.currentTimeMillis(); // 커넥션 생성 종료 시간
          ProductVo vo = dao.selectByPk("APLE5kg");
          long totalEnd = System.currentTimeMillis(); // dao dql 실행 종료 시간
          System.out.printf("ConnTime: %dms, ExecTime: %dms%n",
              (connEnd - connStart), (totalEnd - connEnd));
        } catch (Exception e) {
          System.err.println("Error: " + e.getMessage());
        }
      });
    }

    executor.shutdown();
  }
}
/*
 * ✅ExecutorService: Java의 java.util.concurrent 패키지에 포함된 인터페이스로,
 * 비동기 작업을 실행하고 관리하는 데 사용됩니다. Runnable 또는 Callable 작업을 제출할 수 있습니다.
 * 
 * Runnable 인터페이스
 * Java에서 멀티스레드를 구현하기 위한 핵심 인터페이스
 * 추상메소드 void run() 에 스레드가 실행할 코드를 작성
 * 
 * Executors.newFixedThreadPool(int n):
 * n개의 스레드를 미리 생성해두고, 작업이 들어오면 이 스레드들이 하나씩 처리합니다.
 * 스레드 수가 고정되어 있으므로, 동시에 실행 가능한 작업 수가 제한됩니다.
 * 초과된 작업은 큐에 저장되어 대기하다가 스레드가 비면 실행됩니다.
 * 
 * 자료 구조
 * : Stack 은 LIFO (마지막 입력값을 가장 먼저 처리). 기본 연산 처리 사용
 * : Queue 는 FIFO (먼저 입력된 값을 먼저 처리). 대기열 구현 방식
 * 
 * ExecutorService executor = Executors.newFixedThreadPool(10);
 * 10개의 스레드를 가진 스레드 풀을 생성합니다.
 * 
 * executor.submit(task인터페이스) 또는 executor.execute(task)를 통해 작업을 제출하면,
 * 최대 10개의 작업이 🔥 동시에 실행됩니다.
 * 나머지 작업은 대기 큐에 들어갑니다.
 * 
 * 스레드 수를 너무 크게 설정하면 오히려 성능이 저하될 수 있습니다. CPU 코어 수와 작업 성격에 따라 적절히 조절해야 합니다.
 * 작업이 끝난 후에는 반드시 executor.shutdown() 또는 executor.shutdownNow()로 스레드 풀을 종료해야
 * 합니다.
 */