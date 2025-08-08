package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;

public class MybatisReCustomerDao {
	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();

	public CustomerVo selectByPk(String customerId) {
		// sqlSession.close() 를 try(){} 구문으로 확실하게 실행되도록 함.
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectOne("tblcustomer.selectByPk", customerId);
		}
	}

	public List<CustomerVo> selectAll() {
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectList("tblcustomer.selectAll");
		}
	}

	public int insert(CustomerVo vo) {
		// autocommit 기본값 : false -> spring 에서 Service 클래스에서 트랜잭션 처리합니다.
		// 우리는 spring 이 아니므로 오토 커밋 true로 하여 리팩토링
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.insert("tblcustomer.insert", vo);
		}
	}

	public int update(CustomerVo vo) {
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.update("tblcustomer.update", vo);
		}
	}

	public int delete(String customerId) {
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.delete("tblcustomer.delete", customerId);
		}
	}

}
