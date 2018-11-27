import com.bupt.crud.bean.Department;
import com.bupt.crud.dao.DepartmentMapper;
import com.bupt.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/*
* 测试dao层
*导入springTest功能模块
* @ContextConfiguration 指定spring配置文件的位置
* 直接autowired要是用的组件
* */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

//    测试DepartmentMapper

    @Test
    public void testCRUD(){
//    创建springIOC容器
      /*  ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);*/
      System.out.println(departmentMapper);
      //insert department
        departmentMapper.insertSelective(new Department(null,"开发部"));
     //   departmentMapper.insertSelective(new Department(null,"测试部"));
        //insert employee
      //  employeeMapper.insertSelective(new Employee(null,"张三","M","zhangsan@163.com",3));
        //批量插入多个员工:使用可以执行批量操作的sqlSession
       /* for(){
            employeeMapper.insertSelective(new Employee(null,,"M","zhangsan@163.com",3));
        }*/
       /*EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
       for(int i=0;i<1000;i++){
           String uid = UUID.randomUUID().toString().substring(0,5)+i;
           mapper.insertSelective(new Employee(null,uid,"M",uid+"_bupt@163.com",3));
       }
       System.out.println("finish");*/
    }


}
