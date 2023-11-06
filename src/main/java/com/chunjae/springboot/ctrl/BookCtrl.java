package com.chunjae.springboot.ctrl;

import com.chunjae.springboot.biz.BookService;
import com.chunjae.springboot.entity.Book;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/book/*")
public class BookCtrl {

    @Autowired
    BookService bookService;

    @Autowired
    HttpSession session;


    @GetMapping("list")
    public String bookList(HttpServletRequest request, Model model, MultipartFile img) throws Exception {

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = bookService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Book> bookList = bookService.bookList(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        model.addAttribute("bookList", bookList);
        return "/book/list";
    }

    @GetMapping("get")
    public String lectureUpdate(HttpServletRequest request, Model model) throws Exception {

        int bno = Integer.parseInt(request.getParameter("bno"));
        Book book = bookService.bookGet(bno);

        model.addAttribute("book", book);

        return "/lecture/lectGet";
    }

    @GetMapping("add")
    public String bookAdd(HttpServletRequest request, Model model) throws Exception {
        return "/book/add";
    }

    @PostMapping("add")
    public String bookAddPro(HttpServletRequest request, Model model, MultipartFile img) throws Exception {

        String msg = "";

        ServletContext application = request.getSession().getServletContext();
        //String realPath = application.getRealPath("/resources/upload/lecture");       // 운영 서버
        String realPath = "D:\\seulbee\\uploadtest";

        Book book = new Book();
        book.setTitle(request.getParameter("title"));
        book.setContent(request.getParameter("content"));
        book.setCateId(request.getParameter("cateId"));
        book.setPublish(request.getParameter("publish"));
        book.setAuthor(request.getParameter("author"));
        book.setCost(Integer.parseInt(request.getParameter("cost")));
        book.setImg(request.getParameter("img"));
        book.setQuality(Integer.parseInt(request.getParameter("quality")));

        if(img != null) {
            String originalFilename = img.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            img.transferTo(new File(realPath, uploadFilename));     //파일 등록
            book.setImg(uploadFilename);
        }


        bookService.bookAdd(book);

        return "redirect:/book/list";
    }



    @GetMapping("delete")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        int dno = Integer.parseInt(request.getParameter("dno"));
        bookService.bookDelete(dno);

        return "redirect:/book/list";
    }


}
