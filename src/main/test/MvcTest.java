/* 使用Spring测试模块的提供的测试请求功能，测试crud请求的正确性
*/


import com.bupt.crud.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mvc-dispatcher.xml"})
public class MvcTest {
    //虚拟mvc请求，获取到处理结果
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void initmockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        System.out.println("当前页码：");
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","2")).andReturn();
        //请求成功后，请求域中有pageInfo，我们可以取出 验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo page = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页码："+page.getPageNum());
        System.out.println("总页码："+page.getPages());
        System.out.println("总记录数："+page.getTotal());
        System.out.println("连续显示的页码：");
        int[] nums = page.getNavigatepageNums();
        for(int i:nums){
            System.out.print(" "+i);
        }

        //获取员工数据
        List<Employee> list = page.getList();
        for(Employee e :list){
            System.out.println("ID:"+e.getEmpId()+"==>name"+e.getEmpName());
        }
    }

}
