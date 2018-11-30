package com.bupt.crud.service;

import com.bupt.crud.bean.Employee;
import com.bupt.crud.bean.EmployeeExample;
import com.bupt.crud.bean.EmployeeExample.Criteria;
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

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);


    }

    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count =employeeMapper.countByExample(example);
        return count==0;
        //count==0 返回true 用户名可用。
    }

    public Employee getEmp(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }
    //员工更新
    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //根据id删除emp
    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
}
