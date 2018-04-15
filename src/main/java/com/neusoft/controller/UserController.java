package com.neusoft.controller;

import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.UserMapper;
import com.neusoft.service.UserService;
import com.neusoft.util.MD5;
import com.neusoft.util.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ttc on 2018/3/27.
 */
@Controller
public class UserController {
    @Autowired
    UserService userService;
//    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtil.getSqlSessionFactory();
    @RequestMapping("register")
    public String regUser()
    {
        return "reg";
    }

    @RequestMapping("checkuser/{username}")
    public void checkUser(HttpServletResponse response,@PathVariable String username) throws IOException {

        //判断用户名是否已存在
        int result = userService.isUserNameExist(username);
        if(result > 0)//用户名已存在，跳转回注册页面，让用户换一个账户注册
        {
            response.getWriter().println(1);
        }
        else
        {
            response.getWriter().println(0);
        }
    }

    @RequestMapping("reg")
    public ModelAndView doReg(UserInfo userInfo, HttpServletRequest request,HttpServletResponse response) throws IOException {

        ModelAndView modelAndView = new ModelAndView();

        //判断用户名是否已存在
        int result = userService.isUserNameExist(userInfo.getUsername());
        if(result > 0)//用户名已存在，跳转回注册页面，让用户换一个账户注册
        {
            modelAndView.addObject("error_msg","用户名已存在，请用户换一个账户注册");
            modelAndView.setViewName("reg");

        }
        else//用户名不存在，可以注册
        {

            userInfo.setPassword(MD5.MD5(userInfo.getPassword()));
            userService.regUser(userInfo);

            //跳转到主页index.jsp
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("userinfo",userInfo);

            response.sendRedirect("/");

        }

        return modelAndView;
    }

    @RequestMapping("login")
    public ModelAndView showLoginPage(HttpServletRequest request)
    {
        String preUrl = request.getHeader("Referer");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("preurl",preUrl);
        modelAndView.setViewName("login");

        return modelAndView;
    }

    @RequestMapping("do_login")
    public String login(Model model, UserInfo userInfo, String goto_url, HttpServletRequest request)
    {


        userInfo.setPassword(MD5.MD5(userInfo.getPassword()));
        UserInfo userinfoLogin = userService.userLogin(userInfo);

        if(userinfoLogin != null)//登录成功
        {
            //
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("userinfo",userinfoLogin);

            System.out.println(goto_url);
//            request.getRequestDispatcher("index.jsp").forward(request,response);
//            response.sendRedirect(goto_url);
            return "redirect:"+goto_url;
        }
        else//登录失败
        {
            //转发（跳转）到login.jsp，让用户重新进行登录
//            request.setAttribute("error_msg","用户名密码错误");
            model.addAttribute("error_msg","用户名密码错误");
            return "forward:/WEB-INF/jsp/login.jsp";
//            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    @RequestMapping("logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //销毁当前用户的session
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();

//        request.getRequestDispatcher("index.jsp").forward(request,response);
        response.sendRedirect("/");
    }
}
