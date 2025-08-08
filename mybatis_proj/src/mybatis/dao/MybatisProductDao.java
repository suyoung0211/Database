package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.ProductVo;

public class MybatisProductDao {
	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();

	public ProductVo selectByPk(String pcode) {
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectOne("tblproduct.selectByPk", pcode);
		}
	}

	public List<ProductVo> selectByKeyword(String keyword) {
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectList("tblproduct.selectByKeyword", keyword);
		}
	}

	public int insert(ProductVo vo) {
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.insert("tblproduct.insert", vo);
		}
	}

	public int update(ProductVo vo) {
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.update("tblproduct.update", vo);
		}
	}

	public int delete(String pcode) {
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.delete("tblproduct.delete", pcode);
		}
	}

}
