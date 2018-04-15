package com.neusoft.controller;

import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.UserMapper;

import com.neusoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

import java.io.IOException;
import java.util.UUID;

/**
 * Created by ttc on 2018/3/29.
 */
@Controller
@RequestMapping("currentuser")
public class MyController {

//    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtil.getSqlSessionFactory();

    @Autowired
    UserService userService;

    @RequestMapping("go_article_page")
    public String gotoWriteArticlePage()
    {
        //判断用户当前是否登录，如果没登录，跳转到登录页面
        //否则
        return "add_article";
    }


    @RequestMapping("me")
    public String me()
    {
        //判断用户当前是否登录，如果没登录，跳转到登录页面
        //否则
        return "my";
    }
    @RequestMapping("edit")
    public String edit()
    {
        return "edit";
    }
    @RequestMapping("upload_avatar")
    public String upload_avatar(@RequestParam MultipartFile avatar, HttpServletRequest request) throws IOException {
        String path = request.getServletContext().getRealPath("/upload/");
        File folder = new File(path);
        if(!folder.exists())
        {
            folder.mkdirs();
        }

        UUID uuid = UUID.randomUUID();
        String strUUid = uuid.toString();

        String strFinalPath = path + "/" + strUUid + avatar.getOriginalFilename();

        //将头像保存路径保存到userinfo表中
        //userinfo表中插入一条记录

        HttpSession httpSession = request.getSession();
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userinfo");

        userInfo.setAvatar(strUUid + avatar.getOriginalFilename());
        userService.updateUser(userInfo);

        httpSession.setAttribute("userinfo",userInfo);


        File file = new File(strFinalPath);
        avatar.transferTo(file);

        return "redirect:/currentuser/me";
    }

}
