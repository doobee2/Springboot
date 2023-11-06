package com.chunjae.springboot.ctrl;

import com.chunjae.springboot.biz.NoticeService;
import com.chunjae.springboot.entity.Notice;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeCtrl {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String noticeList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.noticeCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);


        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Notice> noticeList = noticeService.noticeList(page);

        model.addAttribute("msg", "공지사항 리스트를 출력합니다.");
        model.addAttribute("noticeList", noticeList);
        return "/board/notice/list";
    }

    @GetMapping("get")
    public String noticeGet(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeGet(no);
        model.addAttribute("notice", notice);
        return "/board/notice/get";

    }

    @GetMapping("add")
    public String noticeAdd(HttpServletRequest request, Model model) throws Exception{
        return "/board/notice/add";
    }

    @PostMapping("add")
    public String noticeAddpro(HttpServletRequest request, Model model) throws Exception{
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeAdd(notice);
        return "redirect:/notice/list";
    }

    @GetMapping("update")
    public String noticeUpdate(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeGet(no);
        model.addAttribute("notice", notice);
        return "/board/notice/update";
    }

    @PostMapping("update")
    public String noticeUpdatepro(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = new Notice();
        notice.setNo(no);
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeUpdate(notice);
        return "redirect:/notice/list";
    }

    @GetMapping("delete")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        noticeService.noticeDelete(no);
        return "redirect:/notice/list";
    }

}
