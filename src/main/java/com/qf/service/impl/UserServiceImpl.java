package com.qf.service.impl;

import com.qf.dao.UserDao;
import com.qf.pojo.po.User;
import com.qf.pojo.po.vo.UserVO;
import com.qf.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    @Autowired
    private UserDao userDao;

    /*@Override
    public List<User> listUsers() {
        List<User> userList = null;
        try {
            userList = userDao.listUsers();
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return userList;
    }*/

    @Override
    public int saveUser(User user) {
        int i = 0;
        try {
            i = userDao.saveUser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteUserById(int id) {
        int i = 0;
        try {
            i = userDao.deleteUserById(id);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }

/*    @Override
    public User selectUserByUser(User user) {
        try {
            user = userDao.selectUserByUser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return user;
    }*/

    @Override
    public User getUserByUser(User user) {
        try {
            user = userDao.getUserByUser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int updateUser(User user) {
        int i = 0;
        try {
            i = userDao.updateUser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }
    /*搜索*/
    @Override
    public List<User> searchUserByUname(String uname) {
        List<User> users = null;
        try {
            users = userDao.searchUserByUname(uname);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return users;
    }
    /*分页*/
    @Override
    public UserVO findUsersByPage(int pageCount, int currentPage) {
        UserVO<User> userVO = new UserVO<>();
        List<User> userList = null;
        try {
            // 去数据库查询多少用户
            int totalCount = userDao.getUserTotalCount();
            userVO.setTotalCount(totalCount);
            // 一页显示几个用户
            userVO.setPageCount(pageCount);
            // 一共有几页: （总的数量/每页有几个用户）
            int totalPage = (int) Math.ceil((totalCount * 1.0) / pageCount);
            userVO.setTotalPage(totalPage);
            // 当前是第几页
            userVO.setCurrentPage(currentPage);
            // 当前页的所有用户
            // sql：select * from product limit 起始行的索引,此页显示的商品总数
            // 起始行索引： （当前页-1）*每页显示的商品个数
            int offSet = (currentPage - 1) * pageCount;
            userList = userDao.findUsersByPage(offSet,pageCount);
            userVO.setData(userList);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return userVO;
    }
}
