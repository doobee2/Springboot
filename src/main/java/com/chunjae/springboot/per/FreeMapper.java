package com.chunjae.springboot.per;

import com.chunjae.springboot.entity.Free;
import com.chunjae.springboot.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeMapper {
    public List<Free> freeList(Page page) throws Exception;
    public List<Free> freeListForMain() throws Exception;
    public int totalCount(Page page) throws Exception;
    public Free freeGet(int fno) throws Exception;
    public void freeAdd(Free free) throws Exception;
    public void freeUpdate(Free free) throws Exception;
    public void freeDelete(int fno) throws Exception;
}
