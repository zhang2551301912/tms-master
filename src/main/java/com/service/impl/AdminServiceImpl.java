package com.service.impl;

import com.mapper.AdminMapper;
import com.po.Menu;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public List<Menu> getMenu() {
        return adminMapper.getMenu();
    }
}
