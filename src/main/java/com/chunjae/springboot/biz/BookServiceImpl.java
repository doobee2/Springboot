package com.chunjae.springboot.biz;

import com.chunjae.springboot.entity.Book;
import com.chunjae.springboot.per.BookMapper;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<Book> bookList(Page page) throws Exception {
        return bookMapper.bookList(page);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return bookMapper.totalCount(page);
    }

    @Override
    public Book bookGet(int bno) throws Exception {
        return bookMapper.bookGet(bno);
    }

    @Override
    public void bookAdd(Book book) throws Exception {
        bookMapper.bookAdd(book);
    }

    @Override
    public void bookUpdate(Book book) throws Exception {
        bookMapper.bookUpdate(book);
    }

    @Override
    public void bookDelete(int bno) throws Exception {
        bookMapper.bookDelete(bno);
    }
}
