package dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import vo.ProductVo;

public class DBCPTBLProductDao {

    private final DataSource dataSource = DBConnectionPool.getDataSource();

    // 상품 등록
    public int insert(ProductVo vo) {
        int result = 0;
        String sql = "insert into tbl_product(pcode, category, pname, price) values (?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql);) {
            pstat.setString(1, vo.getPcode());
            pstat.setString(2, vo.getCategory());
            pstat.setString(3, vo.getPname());
            pstat.setInt(4, vo.getPrice());

            result = pstat.executeUpdate();
        } catch (SQLException e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    // 상품 update
    public int update(String name, int pirce, String pcode) {
        int result = 0;
        String sql = "update tbl_product set pname = ?, price = ? where pcode = ?";
        try (Connection connection = dataSource.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql)) {
            pstat.setString(1, name);
            pstat.setInt(2, pirce);
            pstat.setString(3, pcode);

            result = pstat.executeUpdate();

        } catch (SQLException e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    // 상품 삭제
    public int delete(String pcode) {
        int result = 0;
        String sql = "delete from tbl_product where pcode = ?";
        try (Connection connection = dataSource.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql)) {
            pstat.setString(1, pcode);

            result = pstat.executeUpdate();

        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    // 상품 조회 : 기본키로 조회
    public ProductVo selectByPk(String pcode) {
        ProductVo vo = null;
        String sql = "select * from tbl_product where pcode = ?";
        try (Connection connection = dataSource.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql);) {
            pstat.setString(1, pcode);
            ResultSet rs = pstat.executeQuery();
            if (rs.next()) {
                vo = new ProductVo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return vo;
    }

    // 상품 조회 : 키워드로 조회 (0 ~ n 개 행 조회)
    // select * from tbl_product where pname like '%kge%'
    public List<ProductVo> searchByKeyword(String keyword) {
        String sql = "select * from tbl_product where pname like '%' || ? || '%'";
        List<ProductVo> list = new ArrayList<>();
        try (
                Connection connection = dataSource.getConnection(); // 커넥션
                PreparedStatement pstat = connection.prepareStatement(sql); // sql 비행 준비
        ) {
            // sql 매개변수
            pstat.setString(1, keyword);

            // select 실행
            ResultSet rs = pstat.executeQuery();

            // ResultSet 결과를 활용
            ProductVo vo = null;
            while (rs.next()) { // rs 의 행집합은 n 개 -> 반복으로 접근
                vo = new ProductVo(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));

                // vo 는 list 에 추가
                list.add(vo);
            }

        } catch (SQLException e) {
            System.out.println("예외 : " + e.getMessage());
            e.printStackTrace(); // 임시 (상세한 예외 원인 파악)
        }

        return list;
    }

}
