package com.service;

import com.po.Menu;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AdminService {
    //查询所有菜单
    List<Menu> getMenu();
}
