package com.bupt.crud.controller;

import com.bupt.crud.bean.Employee;
import com.bupt.crud.bean.Msg;
import com.bupt.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


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
}
