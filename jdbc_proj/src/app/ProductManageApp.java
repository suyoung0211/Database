package app;

import java.util.List;

import dao.TblProductDao;
import vo.ProductVo;

public class ProductManageApp {
    public static void main(String[] args) {
        System.out.println("========= 상품 관리 App ==========");
        boolean run = true;
        while (run) {
            System.out.println("선택 메뉴 : 1. 상품 등록   2. 상품 정보 조회");
            System.out.println("           3. 변경        4. 삭제        5. 검색");
            String menu = System.console().readLine("메뉴 선택 >>>> ");
            switch (menu) {
                case "1":
                    insert();
                    break;
                case "2":
                    selectByPk();
                    break;
                case "3":
                    update();
                    break;
                case "4":
                    delete();
                    break;
                case "5":
                    search();
                    break;
                default:
                    System.out.println("없는 메뉴 입니다.");
                    break;
            }
        }
    }

    private static void insert() {
        System.out.println("\t :: 상품 등록 ::");
        String pcode = System.console().readLine("pcode 입력 >>> ");
        String category = System.console().readLine("category 입력 >>> ");
        String pname = System.console().readLine("pname 입력 >>> ");
        String temp = System.console().readLine("price 입력 >>> ");
        int price = Integer.parseInt(temp);

        TblProductDao dao = new TblProductDao();

        ProductVo vo = new ProductVo(pcode, category, pname, price);
        if (dao.insert(vo) == 0)
            System.out.println("실패!!!");
        else
            System.out.println("완료!!");
    }

    private static void selectByPk() {
        System.out.println("\t :: 상품 정보 조회");
        String pcode = System.console().readLine("조회할 상품 pcode >>> ");

        TblProductDao dao = new TblProductDao();

        if (dao.selectByPk(pcode) == null)
            System.out.println("실패!!!");
        else
            System.out.println(dao.selectByPk(pcode));
    }

    private static void update() {
        System.out.println("\t :: 상품 변경 ::");
        String pcode = System.console().readLine("변경할 상품 pcode >>> ");
        String name = System.console().readLine("변경할 상품 name >>> ");
        String temp = System.console().readLine("변경할 상품 price >>> ");
        int price = Integer.parseInt(temp);

        TblProductDao dao = new TblProductDao();

        if (dao.update(name, price, pcode) == 0)
            System.out.println("실패!!!");
        else
            System.out.println("완료!!");

    }

    private static void delete() {
        System.err.println("\t :: 상품 삭제 ::");
        String pcode = System.console().readLine("삭제할 pcode 입력 >>> ");

        TblProductDao dao = new TblProductDao();

        if (dao.delete(pcode) == 0)
            System.out.println("실패!!!");
        else
            System.out.println("완료!!");
    }

    private static void search() {
        System.out.println("\t 상품 검색");
        String keyword = System.console().readLine("검색어 입력 >>> ");
        TblProductDao dao = new TblProductDao();
        List<ProductVo> list = dao.searchByKeyword(keyword);
        for (ProductVo vo : list) {
            System.out.println(
                    String.format("%5s %s %s %d",
                            vo.getPcode(), vo.getCategory(), vo.getPname(), vo.getPrice()));
        }
    }
}
