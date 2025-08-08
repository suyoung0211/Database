import mybatis.dao.MybatisProductDao;
import mybatis.dao.MybatisReCustomerDao;
import mybatis.vo.CustomerVo;
import mybatis.vo.ProductVo;

public class App {

    public static void main(String[] args) {
        MybatisProductDao dao = new MybatisProductDao();
        // System.out.println("insert result : " +
        // dao.insert(new ProductVo("GALAXY_F", null, "갤럭시폴드7", 22000)));
        // System.out.println("delete result : " + dao.delete("GALAXY_F"));
        System.out.println("select keyword : " + dao.selectByKeyword("kg"));
    }

    /*
     * public static void main(String[] args) throws Exception {
     * MybatisReCustomerDao dao = new MybatisReCustomerDao();
     * int result = dao.insert(
     * new CustomerVo("hongGS22", "홍길순22", "hgs22@a.com", 22, null));
     * System.out.println("insert result : " + result);
     * 
     * System.out.println(dao.selectByPk("hongGS")); // 있는 PK 값
     * System.out.println(dao.selectByPk("hongGSS")); // 없는 PK 값
     * }
     */
}
