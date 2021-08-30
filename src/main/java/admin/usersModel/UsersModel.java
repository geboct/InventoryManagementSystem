package main.java.admin.usersModel;

public class UsersModel {
    String id;
    String name, username,role, lastLogin,status;


    public UsersModel(String id, String name, String username, String role, String lastLogin, String status) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.role = role;
        this.lastLogin = lastLogin;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}