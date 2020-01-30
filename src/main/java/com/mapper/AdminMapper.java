package com.mapper;

import com.po.Menu;

import java.util.List;

public interface AdminMapper {
    //查询所有菜单
    List<Menu> getMenu();
}