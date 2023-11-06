package com.chunjae.springboot.biz;

import com.chunjae.springboot.entity.Notice;
import com.chunjae.springboot.per.NoticeMapper;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> noticeList(Page page) throws Exception {
        return noticeMapper.noticeList(page);
    }

    @Override
    public List<Notice> noticeListForMain() throws Exception {
        return null;
    }

    @Override
    public Notice noticeGet(int no) throws Exception {
        return noticeMapper.noticeGet(no);
    }

    @Override
    public void noticeAdd(Notice notice) throws Exception {
        noticeMapper.noticeAdd(notice);
    }

    @Override
    public void noticeUpdate(Notice notice) throws Exception {
        noticeMapper.noticeUpdate(notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        noticeMapper.noticeDelete(no);
    }

    @Override
    public int noticeCount(Page page) throws Exception {
        return noticeMapper.noticeCount(page);
    }

}
