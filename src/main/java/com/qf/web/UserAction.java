package com.qf.web;

import com.qf.pojo.po.User;
import com.qf.pojo.po.vo.UserVO;
import com.qf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class UserAction {
    @Autowired
    private UserService userService;

    /*@RequestMapping(value = "/listUsers",method = RequestMethod.GET)
    public String showAllUsers(Model model) {
        List<User> userList = userService.listUsers();
        model.addAttribute("userList",userList);
        return "index";
    }*/

    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String addUser(User user) {
        userService.saveUser(user);
        return "redirect:listUsers";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deleteUser(int id) {
        userService.deleteUserById(id);
        return "redirect:listUsers";
    }

    @RequestMapping(value = "/toUpdateUser", method = RequestMethod.GET)
    public String toUpdateUser(User user, Model model) {
        user = userService.getUserByUser(user);
        model.addAttribute("user", user);
        return "updateUser";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:listUsers";
    }
    /*搜索*/
    @RequestMapping(value = "/searchUser", method = RequestMethod.GET)
    public String searchUser(String uname, Model model) {
        List<User> users = userService.searchUserByUname(uname);
        model.addAttribute("users", users);
        return "index";
    }

    /*分页*/
    @RequestMapping(value = "/listUsers",method = RequestMethod.GET)
    public String findUsersByPage(UserVO userVO, Model model) {
        int pageCount = 10;//每页显示的用户数量
        int currentPage = 1;//当前是第几页
        if (userVO.getCurrentPage() != 0) {
            currentPage = userVO.getCurrentPage();
        }
//        List<User> users = userService.findUsersByPage(pageCount,currentPage);
        userVO = userService.findUsersByPage(pageCount,currentPage);
        model.addAttribute("userList", userVO.getData());
        model.addAttribute("userVO", userVO);
        System.out.println(userVO.getData().toString());
//        System.out.println(users.toString());
        return "index";
    }

}
