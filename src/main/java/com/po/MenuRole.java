package com.po;

public class MenuRole {
    private Integer mrId;
    private Integer menuId;
    private Integer roleId;

    private Role role;
    private Menu menu;

    public Integer getMrId() {
        return mrId;
    }

    public void setMrId(Integer mrId) {
        this.mrId = mrId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
