package cn.video.pojo;


import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.util.Objects;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:31 2018/6/15
 * @Description:
 */

public class User implements Serializable {
    private int id;
    private String name;
    private String phone;

    private String password;
    private String email;
    private String head_picture;
    private String signature;


    public User() {
    }

    public User(String name, String phone, String password, String email, String head_picture, String signature) {
        this.name = name;
        this.phone = phone;
        this.password = password;
        this.email = email;
        this.head_picture = head_picture;
        this.signature = signature;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHead_picture() {
        return head_picture;
    }

    public void setHead_picture(String head_picture) {
        this.head_picture = head_picture;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("id", id)
                .append("phone", phone)
                .append("password", password)
                .append("email", email)
                .append("head_picture", head_picture)
                .toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(name, user.name) &&
                Objects.equals(phone, user.phone) &&
                Objects.equals(password, user.password) &&
                Objects.equals(email, user.email) &&
                Objects.equals(head_picture, user.head_picture) &&
                Objects.equals(signature, user.signature);
    }

    @Override
    public int hashCode() {

        return Objects.hash(name, phone, password, email, head_picture, signature);
    }

    public static void main(String[] args) {
        User user = new User();
        user.setName("zhangsan");
        User user1 = new User();
        user1.setName("zhangsan");
        System.out.println(user.equals(user1));

    }
}
