package mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public class BuyMapperDao {
  private SqlSessionFactory sqlSessionFactory = SqlSessionBean.getSessionFactory();

  public List<BuyVo> selectByCustomer(String customerId) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
  // BuyMapper 인터페이스의 구현체(클래스로 만든 객체)는 SqlSession 객체가 getMapper 메소드로 만듭니다.
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectByCustomer(customerId);
    }
  }

  public List<BuyVo> selectByPcode(String pcode) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectByPcode(pcode);
    }
  }

  public List<BuyVo> selectByYear(String year) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectByYear(year);
    }
  }

  public int selectSumByPcode(String pcode) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectSumByPcode(pcode);
    }
  }

  public List<CustomerBuyVo> BuyByCustomer(String customer_id) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectBuyByCustomer(customer_id);
    }
  }

  // 조인과 집계 함수
  public Map<String, Integer> countByYear(String year) {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectCountByYear(year);
    }
  }

  // List<Map<String, Integer>>
  public List<Map<String, Object>> allCountByYear() {
    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
      BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
      return mapper.selectAllCountByYear();
    }
  }

}
