package com.chunjae.springboot.per;

import com.chunjae.springboot.entity.Book;
import com.chunjae.springboot.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
    public List<Book> bookList(Page page) throws Exception;
    public int totalCount(Page page) throws Exception;
    public Book bookGet(int bno) throws Exception;
    public void bookAdd(Book book) throws Exception;
    public void bookUpdate(Book book) throws Exception;
    public void bookDelete(int bno) throws Exception;
}
