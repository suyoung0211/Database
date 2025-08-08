package mybatis.mapper;

import java.util.List;

import mybatis.vo.StudentVo;

// SQL 매퍼 XML 파일 내용으로 인터페이스 정의
// SqlSession 이 인터페이스의 구현 클래스와 객체를 생성.
public interface StudentMapper {
    StudentVo selectByPk(String stuno);

    List<StudentVo> selectAll();

    List<String> selectStuno(); // 단일 컬럼을 여러 행 조회 SQL

    // resultType 에는 지정 없지만 int 로 실행결과 행의 갯수 리턴 받음.
    int insert(StudentVo vo);

    int update(StudentVo vo);

    int delete(String stuno);
}
