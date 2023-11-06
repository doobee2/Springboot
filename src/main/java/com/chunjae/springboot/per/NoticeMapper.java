package com.chunjae.springboot.per;

import com.chunjae.springboot.entity.Notice;
import com.chunjae.springboot.entity.User;
import com.chunjae.springboot.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    public List<Notice> noticeList(Page page);

    public Notice noticeListPro();

    public Notice noticeGet(int no);

    public int noticeCount(Page page);

    public void noticeListForMain(User user);

    public void noticeAdd(Notice notice);

    public void noticeUpdate(Notice notice);

    public void noticeDelete(int no);

    public Notice noticeVisited(int no);


}
