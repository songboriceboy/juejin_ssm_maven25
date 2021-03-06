package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.CategoryInfo;
import com.neusoft.domain.UploadRes;
import com.neusoft.domain.UserInfo;
import com.neusoft.service.CategoryService;
import com.neusoft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
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
    @Autowired
    CategoryService categoryService;
    @RequestMapping("go_article_page")
    public String gotoWriteArticlePage(Model model)
    {
        //判断用户当前是否登录，如果没登录，跳转到登录页面
        //否则
        List<CategoryInfo> categoryInfoList = categoryService.getAllCategroies();
        model.addAttribute("cates",categoryInfoList);
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
    public void upload_avatar(@RequestParam MultipartFile avatar, HttpServletRequest request, HttpServletResponse response) throws IOException {
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

        UploadRes uploadRes = new UploadRes();
        uploadRes.setSrc(strUUid + avatar.getOriginalFilename());
        String strJson = JSON.toJSONString(uploadRes);
        response.getWriter().println(strJson);
//        return "redirect:/currentuser/me";
    }

}
