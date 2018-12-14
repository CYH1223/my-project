package com.qf.dao;

import com.qf.pojo.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
//    List<User> listUsers();

    int saveUser(User user);

    int deleteUserById(int id);

    User getUserByUser(User user);

    int updateUser(User user);

    List<User> searchUserByUname(String uname);

    int getUserTotalCount();

    List<User> findUsersByPage(@Param("offSet") int offSet,@Param("pageCount") int pageCount);


//    User selectUserByUser(User user);
}
