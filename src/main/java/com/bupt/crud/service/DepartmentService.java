package com.bupt.crud.service;

import com.bupt.crud.bean.Department;
import com.bupt.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    //查询所有员工,这不是一个分页查询
    //引入PageHelper分页插件

    public List<Department> getDepts(){

        return departmentMapper.selectByExample(null);
    }
}
