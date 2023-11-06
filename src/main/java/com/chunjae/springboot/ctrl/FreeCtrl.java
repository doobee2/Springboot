package com.chunjae.springboot.ctrl;

import com.chunjae.springboot.biz.FreeService;
import com.chunjae.springboot.entity.Free;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/free/*")
public class FreeCtrl {

    @Autowired
    private FreeService freeService;

    @Autowired
    HttpSession session;

    @GetMapping("list")
    public String getfreeList(HttpServletRequest request, Model model) throws Exception {

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);


        List<Free> freeList = freeService.freeList(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        model.addAttribute("freeList", freeList);
        return "/board/free/list";
    }

    @GetMapping("get")
    public String getfreeGet(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free free = freeService.freeGet(fno);

        model.addAttribute("free", free);
        model.addAttribute("fno", fno);
        System.out.println("free : " + free);

        System.out.println("fno : " + fno);
        return "/board/free/get";
    }

    @GetMapping("add")
    public String addForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/free/add";
    }

    @PostMapping("add")
    public String freeAdd(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        Free free = new Free();
        free.setTitle(request.getParameter("title"));
        free.setContent(request.getParameter("content"));
        free.setAuthor(sid);
        freeService.freeAdd(free);
        return "redirect:/free/list";
    }

    @GetMapping("delete")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int fno = Integer.parseInt(request.getParameter("fno"));
        freeService.freeDelete(fno);
        if(!sid.equals("admin")) {
            return "redirect:/free/list";
        } else {
            return "redirect:/admin/FreeListAdmin";
        }
    }


    @PostMapping("update")
    public String freeUpdate(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free free = new Free();
        free.setFno(fno);
        free.setTitle(request.getParameter("title"));
        free.setContent(request.getParameter("content"));
        freeService.freeUpdate(free);
        return "redirect:/free/list";
    }




}
