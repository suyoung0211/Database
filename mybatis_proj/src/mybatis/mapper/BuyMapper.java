package mybatis.mapper;

import java.util.List;
import java.util.Map;

import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public interface BuyMapper {
  List<BuyVo> selectByCustomer(String customer_id);

  List<BuyVo> selectByPcode(String pcode);

  List<BuyVo> selectByYear(String year);

  int selectSumByPcode(String pcode);

  // join
  List<CustomerBuyVo> selectBuyByCustomer(String cutomer_id);

  // count 집계 합수
  Map<String, Integer> selectCountByYear(String year);
  
  // 
  List<Map<String, Object>> selectAllCountByYear();
  
}
