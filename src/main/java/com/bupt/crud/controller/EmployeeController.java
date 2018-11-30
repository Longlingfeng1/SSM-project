package com.bupt.crud.controller;

import com.bupt.crud.bean.Employee;
import com.bupt.crud.bean.Msg;
import com.bupt.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/*
* 处理CRUD请求
* */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){

        PageHelper.startPage(pn,5);

        List<Employee> emps = employeeService.getALL();

        //使用pageinfo包装查询后的结果，只需要将pageinfo交给页面
        //封装了详细的分页信息，包括有查询出来的数据,传入连续显示的页数-->5
        PageInfo page = new PageInfo(emps,5);

        return Msg.success().add("pageInfo",page);

    }

    //查询员工数据（分页查询）
    //引入PageHelper分页插件
    //在查询之前只需要调用，传入代码，以及每页的数目
    //@RequestMapping("/emps")
   /* public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);

        List<Employee> emps = employeeService.getALL();

        //使用pageinfo包装查询后的结果，只需要将pageinfo交给页面
        //封装了详细的分页信息，包括有查询出来的数据,传入连续显示的页数-->5
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }*/


    /*后端校验：
    1，支持JSP303校验
    2，导入hibernate-Validator*/

    @RequestMapping(value="/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败
            Map<String,Object> map = new HashMap();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                System.out.println("错误的字段名  "+fieldError.getField());
                System.out.println("错误信息  "+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());

            }
            return Msg.fail().add("errorFields",map);
        }else{
            System.out.println("success");
            employeeService.saveEmp(employee);
            return Msg.success();

        }

    }

    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam("empName")String empName){
        //后端 校验用户名
        String regx = "(^[a-zA-Z0-9_]{5,20}$)|(^[\\u4e00-\\u9fa5]{2,8}$)";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","姓名必须是2-8位中文或者5-20位英文数字组合");
        }

        //校验用户名是否存在
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名已存在");
        }

    }
    //根据id查询员工
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }


   /* 如果直接发送ajax=PUT请求
    封装的数据只有empId，其他的属性都为null;
    问题；
    原因：tomcat： 1请求体中的数据，封装一个map；
                  2requset.getParameter("empName")将会从这个map中取值
    3springmvc封装POJO中每个属性的值 调用 request.getParameter("email")

    AJAX发送PUT请求引发的血案；
            PUT请求，请求体中的数据requset.getParameter（）都拿不到，
            tomcat 一看是PUT请求，就不会封装请求体中的数据为map，只有POST请求
            */
    //保存员工
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        System.out.println(employee);
        employeeService.update(employee);
        return Msg.success();
    }


    //单个删除
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("id") Integer id){
        employeeService.deleteEmpById(id);
        return Msg.success();
}
}
