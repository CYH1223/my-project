package com.qf.service;

import com.qf.pojo.po.User;
import com.qf.pojo.po.vo.UserVO;

import java.util.List;

public interface UserService {
//    List<User> listUsers();

    int saveUser(User user);

    int deleteUserById(int id);

    User getUserByUser(User user);

    int updateUser(User user);

    List<User> searchUserByUname(String uname);

        UserVO findUsersByPage(int pageCount, int currentPage);
//    List<User> findUsersByPage(int pageCount, int currentPage);

    /*    User selectUserByUser(User user);*/
}
