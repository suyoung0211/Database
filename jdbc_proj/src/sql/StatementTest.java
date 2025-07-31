package sql;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import util.OracleConnection;

public class StatementTest {
    public static void main(String[] args) {
        Statement stat = null; // 마지막에 close 필요
        Connection conn = OracleConnection.getConnection();
        try {
            stat = conn.createStatement(); // SQL 실행 객체를 connection 으로 생성
            String sql = "INSERT INTO tbl_javadict(idx,english,korean,step) VALUES (33, 'connection', '연결, 접속', '2')";

            stat.execute(sql); // 오라클에게 완성된 sql 전달. 오라클 파싱 -> 컴파일 -> 실행

            System.out.println("SQL 실행 완료 : " + sql);
        } catch (SQLException e) {
            System.out.println("SQL 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(conn);
        }
    }
}
