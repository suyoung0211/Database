package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.OracleConnection;

public class MyTblBuySelectTest {
    public static void main(String[] args) {
        selectByPk();
        // selectByCustomerId();
    }

    public static void selectByPk() {
        String temp = System.console().readLine("구매 번호 입력 >>> ");
        String sql = "select * from tbl_buy where buy_seq = ?"; // buy_seq 컬럼 조회하기
        Connection connection = OracleConnection.getConnection();
        try (
                PreparedStatement pstat = connection.prepareStatement(sql); // 자동 close
        ) {
            // 매개변수값 전달하기
            int buy_seq = Integer.parseInt(temp);
            pstat.setInt(1, buy_seq);

            // 실행한 결과 행집합 ResultSet 타입으로 참조하기
            ResultSet rs = pstat.executeQuery();
            boolean result = rs.next();

            // 결과 행 있으면 가져오기(1회) - 컬럼값들 출력
            if (result) {
                System.out.println("### buy_seq 컬럼으로 조회하기 ###");
                System.out.println("BUY_SEQ : " + rs.getInt(1));
                System.out.println("CUSTOMER_ID : " + rs.getString(2));
                System.out.println("PCODE : " + rs.getString(3));
                System.out.println("QUANTITY : " + rs.getInt(4));
                System.out.println("BUY_DATE : " + rs.getString(5));
            } else {
                System.out.println("구매 번호가 없습니다.");
            }

        } catch (SQLException | NumberFormatException e) {
            System.out.println("selectByPk 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(connection);
        }
    }

    public static void selectByCustomerId() {
        String customerid = System.console().readLine("구매 내역 조회 고객ID 입력 >>> ");
        String sql = "select * from tbl_buy where customer_id = ?"; // customer_id 컬럼 조회하기
        Connection connection = OracleConnection.getConnection();
        try (
                PreparedStatement pstat = connection.prepareStatement(sql); // 자동 close
        ) {
            // 매개변수값 전달하기
            pstat.setString(1, customerid);

            // 실행한 결과 행집합 ResultSet 타입으로 참조하기
            ResultSet rs = pstat.executeQuery();
            boolean result = rs.next();

            // 순차적으로 결과 행 가져오기(n회) - 칼럼 값들 출력
            System.out.println("### customer_id 컬럼으로 조회하기 ###");

            if (!result) {
                System.out.println("구매 내역 ID 가 없습니다.");
            } else {
                while (result) {
                    System.out.println(
                            String.format("BUY_SEQ : %d, CUSTOMER_ID : %s, PCODE : %s, QUANTITY : %d, BUY_DATE : %s",
                                    rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
                    result = rs.next();
                }
            }

        } catch (SQLException e) {
            System.out.println("selectByCustomerId 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(connection);
        }
    }

}
