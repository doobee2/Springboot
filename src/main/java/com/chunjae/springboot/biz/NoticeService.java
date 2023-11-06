package com.chunjae.springboot.biz;

import com.chunjae.springboot.entity.Notice;
import com.chunjae.springboot.util.Page;

import java.util.List;

public interface NoticeService {

    public List<Notice> noticeList(Page page) throws Exception;
    public List<Notice> noticeListForMain() throws Exception;
    public Notice noticeGet(int no) throws Exception;
    public void noticeAdd(Notice notice) throws Exception;
    public void noticeUpdate(Notice notice) throws Exception;
    public void noticeDelete(int no) throws Exception;
    public int noticeCount(Page page) throws Exception;
}
