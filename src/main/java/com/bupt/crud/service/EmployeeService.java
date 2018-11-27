package com.bupt.crud.service;

import com.bupt.crud.bean.Employee;
import com.bupt.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    //查询所有员工,这不是一个分页查询
    //引入PageHelper分页插件

    public List<Employee> getALL(){

        return employeeMapper.selectByExampleWithDept(null);
    }
}
