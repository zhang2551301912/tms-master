package com.po;

public class MenuRole {
    private Integer mr_id;
    private Integer menu_id;
    private Integer role_id;

    private Role role;
    private Menu menu;

    public Integer getMr_id() {
        return mr_id;
    }

    public void setMr_id(Integer mr_id) {
        this.mr_id = mr_id;
    }

    public Integer getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(Integer menu_id) {
        this.menu_id = menu_id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
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
