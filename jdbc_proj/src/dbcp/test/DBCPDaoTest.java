package dbcp.test;

import dbcp.DBCPTBLStudentDao;

public class DBCPDaoTest {
    public static void main(String[] args) {
        DBCPTBLStudentDao dao = new DBCPTBLStudentDao();
        dao.insert("2025990", "김구구2", "22", "서울시 구로구");
    }
}
