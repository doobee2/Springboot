package com.chunjae.springboot.biz;

import com.chunjae.springboot.entity.Free;
import com.chunjae.springboot.per.FreeMapper;
import com.chunjae.springboot.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeMapper freeMapper;


    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeMapper.freeList(page);
    }

    @Override
    public List<Free> freeListForMain() throws Exception {
        return freeMapper.freeListForMain();
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeMapper.totalCount(page);
    }

    @Override
    public Free freeGet(int fno) throws Exception {
        return freeMapper.freeGet(fno);
    }

    @Override
    public void freeAdd(Free free) throws Exception {
        freeMapper.freeAdd(free);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        freeMapper.freeDelete(fno);
    }

    @Override
    public void freeUpdate(Free free) throws Exception {
        freeMapper.freeUpdate(free);
    }
}
